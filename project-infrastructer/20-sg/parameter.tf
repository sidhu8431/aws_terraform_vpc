resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.env}/mysql_sg_id"
  type  = "String"
  value = module.mysql_sg.id.id
}
# resource "aws_ssm_parameter" "backend_sg_id" {
#   name  = "/${var.project_name}/${var.env}/backend_sg_id"
#   type  = "String"
#   value = module.backend_sg.id.id
# }
# resource "aws_ssm_parameter" "frontend_sg_id" {
#   name  = "/${var.project_name}/${var.env}/frontend_sg_id"
#   type  = "String"
#   value = module.frontend_sg.id.id
# }
resource "aws_ssm_parameter" "bastion_sg_id" {
  name  = "/${var.project_name}/${var.env}/bastion_sg_id"
  type  = "String"
  value = module.bastion_sg.id.id
}

resource "aws_ssm_parameter" "backend_sg_id" {
  name  = "/${var.project_name}/${var.env}/backend_sg_id"
  type  = "String"
  value = module.backend_sg.id.id
}

resource "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/${var.project_name}/${var.env}/frontend_sg_id"
  type  = "String"
  value = module.frontend_sg.id.id
}