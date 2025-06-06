output "public_subnet" {
  value = aws_subnet.public_subnet[*].id
}
output "private_Subnet" {
  value = aws_subnet.private_subnet_cidr[*].id
}
output "DataBase_Subnet" {
  value = aws_subnet.database_subnet_cidr[*].id
}
output "az" {
  value = data.aws_availability_zones.available
}
output "vpc_id" {
  value = aws_vpc.main.id
}
output "default" {
  value = data.aws_vpc.default
}
output "main_routetable_info" {
  value = data.aws_route_table.default_rt
}

# output "RDS_name" {
#   value = aws_db_subnet_group.RDS.name
# }
output "database_subnet_ids" {
  value = aws_subnet.aws_db_subnet_group.RDS.id
}
output "RDS_name" {
  value = aws_db_subnet_group.RDS.name
}
