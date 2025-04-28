variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}


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

variable "public_subnet_cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidr" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "database_subnet_cidr" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
  default     = ["10.10.21.0/24", "10.10.22.0/24"]
}

variable "env" {
  description = "Deployment environment (e.g., DEV, STAGING, PROD)"
  type        = string
  default     = "DEV"
}
variable "is_vpc_peering_request" {
  default = true
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Maintainer = "Siddhartha"
    Terraform  = true
  }

}