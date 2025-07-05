# ---------------------------------------------------------
# VPC Create kar raha hai with CIDR block
# ---------------------------------------------------------
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr    # CIDR block ko variable se le rahe hain
  enable_dns_hostnames = true            # DNS hostnames enable kar diye (useful for EKS/EC2)
  tags = {
    Name = "${var.env_name}-vpc"          # Tag se resource easy identify ho jata hai
  }
}

# ---------------------------------------------------------
# Internet Gateway - VPC ko internet se connect karne ke liye
# ---------------------------------------------------------
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id               # Is VPC ka IGW ban raha hai
  tags = {
    Name = "${var.env_name}-igw"
  }
}

# ---------------------------------------------------------
# Public Subnet bana rahe hain - example with count
# ---------------------------------------------------------
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)  # Kitne public subnets banana hai
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)    # AZ ka bhi variable use kar rahe hain
  map_public_ip_on_launch = true                              # EC2 launch pe public IP milegi

  tags = {
    Name = "${var.env_name}-public-${count.index + 1}"
  }
}

# ---------------------------------------------------------
# Private Subnet bana rahe hain - same tarah
# ---------------------------------------------------------
resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)

  tags = {
    Name = "${var.env_name}-private-${count.index + 1}"
  }
}

# ---------------------------------------------------------
# Public Route Table + IGW route
# ---------------------------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env_name}-public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"    # Internet ke liye default route
  gateway_id             = aws_internet_gateway.this.id
}

# ---------------------------------------------------------
# Associate Public Subnets to Public Route Table
# ---------------------------------------------------------
resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
# ---------------------------------------------------------
# Security Group
# ---------------------------------------------------------
resource "aws_security_group" "default" {
  name        = "${var.env_name}-default-sg"
  description = "Default security group for ${var.env_name}"
  vpc_id      = aws_vpc.this.id

  # inbound SSH, HTTP, HTTPS
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Careful! Use your office IP in prod
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_name}-default-sg"
  }
}

