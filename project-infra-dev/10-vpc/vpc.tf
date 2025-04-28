module "vpc" {
  source = "git::https://github.com/sidhu8431/aws_terraform_vpc.git//aws-vpc?ref=main"
  #  source = "git::https://github.com/sidhu8431/aws_terraform_vpc.git?ref=main"
  # source = "../aws-vpc"
  vpc_cidr               = var.vpc_cidr
  project_name           = var.project_name
  region                 = var.region
  public_subnet_cidr     = var.public_subnet_cidr
  private_subnet_cidr    = var.private_subnet_cidr
  database_subnet_cidr   = var.database_subnet_cidr
  env                    = var.env
  is_vpc_peering_request = var.is_vpc_peering_request
  # aws_db_subnet_group_rds_subnet = var.aws_db_subnet_group_rds_subnet
}