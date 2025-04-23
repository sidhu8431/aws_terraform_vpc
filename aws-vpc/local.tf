locals {
  vpc_name             = "${var.project_name}-${var.env}-vpc"
  igw_name             = "${var.project_name}-${var.env}-igw"
  public_subnet_name   = "${var.project_name}-${var.env}-public_Subnet"
  private_subnet_name  = "${var.project_name}-${var.env}-private_Subnet"
  database_subnet_name = "${var.project_name}-${var.env}-DataBase_Subnet"
  az_zone              = slice(data.aws_availability_zones.available.names, 0, 2)
  public_rt_name = "${var.project_name}-${var.env}-public-RT"
  private_rt_name = "${var.project_name}-${var.env}-private-RT"
  database_rt_name = "${var.project_name}-${var.env}-databases-RT"
}