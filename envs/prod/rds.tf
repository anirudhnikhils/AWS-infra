module "rds" {
  source                 = "../../modules/rds"
  env_name               = var.env_name
  db_name                = "stagingdb"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  db_username            = local.db_username
  db_password            = local.db_password
  vpc_security_group_ids = [module.vpc.default_sg_id]
  db_subnet_ids          = module.vpc.private_subnet_ids
  multi_az               = true
}