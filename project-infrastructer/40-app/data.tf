data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.env}/mysql_sg_id"
}
data "aws_ssm_parameter" "backend_sg_id" {
  name = "/${var.project_name}/${var.env}/backend_sg_id"
}
# data "aws_ssm_paramter" "frontend_sg_id" {
#   name = "/${var.project_name}/${var.env}/frontend_sg_id"
# }
# data "aws_ssm_paramter" "public_Subnet" {
#   name = "/${var.project_name}/${var.env}/public_Subnet"
# }
# data "aws_ssm_paramter" "private_subnet" {
#   name = "/${var.project_name}/${var.env}/private_subnet"
# }
# data "aws_ssm_paramter" "database_subnet" {
#   name = "/${var.project_name}/${var.env}/database_subnet"
# }

data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project_name}/${var.env}/frontend_sg_id"
}

data "aws_ssm_parameter" "public_Subnet" {
  name = "/${var.project_name}/${var.env}/public_Subnet"
}

data "aws_ssm_parameter" "private_subnet" {
  name = "/${var.project_name}/${var.env}/private_subnet"
}

data "aws_ssm_parameter" "database_subnet" {
  name = "/${var.project_name}/${var.env}/database_subnet"
}
