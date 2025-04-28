
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

variable "database_tags" {
  default = {
    compount = "ec2 public"
    sg_name  = "database server"
  }
}

variable "backend_tags" {
  default = {
    compount = "ec2 public"
    sg_name  = "backend server"
  }
}
variable "frontend_tags" {
  default = {
    compount = "ec2 public"
    sg_name  = "frontend server"
  }
}