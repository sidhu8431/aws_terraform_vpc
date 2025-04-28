
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "logistics"
}

variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-2"
}
variable "env" {
  description = "Deployment environment (e.g., DEV, STAGING, PROD)"
  type        = string
  default     = "DEV"
}
variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Maintainer = "Siddhartha"
    Terraform  = true
  }

}
variable "mysql_sg_tags" {
  default = {
    compount = "security group sg"
    sg_name  = "mysql sg"
  }
}
variable "backend_sg_tags" {
  default = {
    compount = "security group sg"
    sg_name  = "backend sg"
  }
}
variable "frontend_sg_tags" {
  default = {
    compount = "security group sg"
    sg_name  = "frontend sg"
  }
}
variable "bastion_sg_tags" {
  default = {
    compount = "security group sg"
    sg_name  = "frontend sg"
  }
}