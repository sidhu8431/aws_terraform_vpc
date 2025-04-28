locals {
  bastion_name  = "${var.project_name}-${var.env}-bastion_server"
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  #   bastion_subent_id = slice(",", data.aws_ssm_parameter.public_subnet_cidr_id.values)[0]
  # bastion_subnet_id = split(",", data.aws_ssm_parameter.public_subnets.value)[0]
  bastion_subnet_id = split(",", data.aws_ssm_parameter.public_Subnet.value)[0]

}