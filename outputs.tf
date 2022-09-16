output "app_subnets" {
  value = local.apps_subnets_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "workstation_ip" {
  value = var.WORKSTATION_IP
}

output "vpc_cidr" {
  value = var.vpc_cidr_block
}
