resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}
# resource "aws_ssm_parameter" "public_subnet_cidr_id" {
#   name  = "/${var.project_name}/${var.env}/public_subnet_cidr_id"
#   type  = "String"
#   value = join(",", module.vpc.public_subnet_cidr)


# }
resource "aws_ssm_parameter" "public_Subnet" {
  name  = "/${var.project_name}/${var.env}/public_Subnet"
  type  = "String"
  value = join(",", module.vpc.public_subnet)
}
resource "aws_ssm_parameter" "private_subnet" {
  name  = "/${var.project_name}/${var.env}/private_subnet"
  type  = "String"
  value = join(",", module.vpc.private_Subnet)
}
resource "aws_ssm_parameter" "database_subnet" {
  name  = "/${var.project_name}/${var.env}/database_subnet"
  type  = "String"
  value = join(",", module.vpc.DataBase_Subnet)
}