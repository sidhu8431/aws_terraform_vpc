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
output "id" {
  value = module.mysql.id
}