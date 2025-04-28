module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = local.bastion_name

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.bastion_sg_id]
  #   subnet_id              = local.bastion_subent_id
  subnet_id = local.bastion_subnet_id
  tags = merge(var.common_tags,
    var.bastion_server_tags,
    {
      Name = local.bastion_name
    }
  )
}