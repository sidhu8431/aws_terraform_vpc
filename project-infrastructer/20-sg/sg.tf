module "mysql_sg" {
  #   source = "../aws_sg"
  source       = "git::https://github.com/sidhu8431/aws_terraform_vpc.git//aws_sg?ref=main"
  project_name = var.project_name
  env          = var.env
  sg_name      = "mysql_sg"
  sg_tags      = var.mysql_sg_tags
  common_tags  = var.common_tags
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
}
module "backend_sg" {
  #   source = "../aws_sg"
  source       = "git::https://github.com/sidhu8431/aws_terraform_vpc.git//aws_sg?ref=main"
  project_name = var.project_name
  env          = var.env
  sg_name      = "backend_sg"
  sg_tags      = var.backend_sg_tags
  common_tags  = var.common_tags
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
}
module "frontend_sg" {
  #   source = "../aws_sg"
  source       = "git::https://github.com/sidhu8431/aws_terraform_vpc.git//aws_sg?ref=main"
  project_name = var.project_name
  env          = var.env
  sg_name      = "frontend_sg"
  sg_tags      = var.frontend_sg_tags
  common_tags  = var.common_tags
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
}
module "bastion_sg" {
  #   source = "../aws_sg"
  source       = "git::https://github.com/sidhu8431/aws_terraform_vpc.git//aws_sg?ref=main"
  project_name = var.project_name
  env          = var.env
  sg_name      = "bastion_sg"
  sg_tags      = var.bastion_sg_tags
  common_tags  = var.common_tags
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
}
#sg port map mysql to backend 

resource "aws_security_group_rule" "mysqltobackend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.backend_sg.id.id
  security_group_id        = module.mysql_sg.id.id
}

# sg port map backend to frontend

resource "aws_security_group_rule" "backendtofrontend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.frontend_sg.id.id
  security_group_id        = module.backend_sg.id.id
}

# sg port map frontend to all user access

resource "aws_security_group_rule" "frontendtopublic" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_sg.id.id
}

# sg port map bastion server to mysql

resource "aws_security_group_rule" "bastiontopublic" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.id.id
  security_group_id        = module.mysql_sg.id.id
}
