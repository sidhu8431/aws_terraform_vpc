module "mysql" {
#   source = "../aws_sg"
 source = "git::https://github.com/sidhu8431/aws_terraform_vpc.git//aws_sg?ref=main"
  project_name = var.project_name
  env = var.env
  sg_name = "mysql_sg"
  sg_tags = var.sg_tags
  common_tags = var.common_tags
  vpc_id = module.vpc.vpc_id
}

