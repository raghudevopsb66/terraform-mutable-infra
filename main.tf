module "vpc" {
  source                 = "./vendor/modules/vpc/"
  cidr_block             = var.vpc_cidr_block
  subnets                = var.subnets
  env                    = var.env
  AZ                     = var.AZ
  default_vpc_id         = var.default_vpc_id
  default_vpc_cidr       = var.default_vpc_cidr
  default_route_table_id = var.default_route_table_id
}

module "docdb" {
  source         = "./vendor/modules/docdb/"
  env            = var.env
  engine_version = var.docdb_engine_version
  db_subnets_ids = local.db_subnets_ids
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  instance_count = var.docdb_cluster_instances_count
  instance_class = var.docdb_instance_class
  WORKSTATION_IP = var.WORKSTATION_IP
}

module "rds" {
  source         = "./vendor/modules/rds/"
  env            = var.env
  engine_version = var.rds_engine_version
  db_subnets_ids = local.db_subnets_ids
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  instance_count = var.rds_cluster_instances_count
  instance_class = var.rds_instance_class
  WORKSTATION_IP = var.WORKSTATION_IP
}

module "elasticache" {
  source         = "./vendor/modules/elasticache/"
  env            = var.env
  engine_version = var.elasticache_engine_version
  db_subnets_ids = local.db_subnets_ids
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  instance_count = var.elasticache_cluster_instances_count
  instance_class = var.elasticache_instance_class
}

module "rabbitmq" {
  source         = "./vendor/modules/rabbitmq/"
  env            = var.env
  db_subnets_ids = local.db_subnets_ids
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  instance_type  = var.rabbitmq_instance_type
  WORKSTATION_IP = var.WORKSTATION_IP
}


