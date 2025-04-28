output "public_Subnet" {
  value = module.vpc.public_subnet
}
output "private_subnet" {
  value = module.vpc.private_Subnet
}
output "database_subnet" {
  value = module.vpc.DataBase_Subnet
}
output "az" {
  value = module.vpc.az
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "default" {
  value = module.vpc.default
}
output "main_routetable_info" {
  value = module.vpc.main_routetable_info
}
# output "RDS_name" {
#   value = module.vpc.RDS_name
# }

# output "database_subnet_ids" {
#   value = aws_subnet.database[*].id
# }
# output "RDS_name" {
#   value = aws_db_subnet_group.RDS.name
# }
output "RDS_name" {
  value = module.vpc.database_subnet_group_name
}
