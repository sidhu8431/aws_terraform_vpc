locals {
  resource_name   = "${var.project_name}-${var.env}"
  mysql_sg_id     = data.aws_ssm_parameter.mysql_sg_id.value
  backend_sg_id   = data.aws_ssm_parameter.backend_sg_id.value
  frontend_sg_id  = data.aws_ssm_parameter.frontend_sg_id.value
  public_Subnet   = split(",", data.aws_ssm_parameter.public_Subnet.value)[0]
  private_subnet  = split(",", data.aws_ssm_parameter.private_subnet.value)[0]
  database_subnet = split(",", data.aws_ssm_parameter.database_subnet.value)[0]
}