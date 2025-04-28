output "mysql_sg_id" {
  value = module.mysql_sg.id.id
  # sensitive = true
}
output "backend_sg_id" {
  value = module.mysql_sg.id.id
  # sensitive = true
}
output "frontend_sg_id" {
  value = module.frontend_sg.id.id
  # sensitive = true
}
output "bastion_sg_id" {
  value = module.bastion_sg.id.id
}
