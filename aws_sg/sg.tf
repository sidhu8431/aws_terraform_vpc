resource "aws_security_group" "allow_tls" {
  name = local.final_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = merge( var.common_tags,
  var.sg_tags, 
  {
    Name = local.final_sg_name
  }
  )
}

