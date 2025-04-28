data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.env}/bastion_sg_id "
}

data "aws_ssm_parameter" "public_Subnet" {
  name = "/${var.project_name}/${var.env}/public_Subnet"
}

