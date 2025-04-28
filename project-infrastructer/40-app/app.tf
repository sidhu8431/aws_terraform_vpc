module "mysql_server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-mysql_server"

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.mysql_sg_id]
  #   subnet_id              = local.bastion_subent_id
  subnet_id = local.database_subnet
  tags = merge(var.common_tags,
    var.database_tags,
    {
      Name = "${local.resource_name}-mysql_server"
    }
  )
}

module "backend_server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-backend_server"

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.mysql_sg_id]
  #   subnet_id              = local.bastion_subent_id
  subnet_id = local.private_subnet
  tags = merge(var.common_tags,
    var.backend_tags,
    {
      Name = "${local.resource_name}-backend_server"
    }
  )
}

module "frontend_server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-frontend_server"

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.frontend_sg_id]
  #   subnet_id              = local.bastion_subent_id
  subnet_id = local.public_Subnet
  tags = merge(var.common_tags,
    var.frontend_tags,
    {
      Name = "${local.resource_name}-frontend_server"
    }
  )
}