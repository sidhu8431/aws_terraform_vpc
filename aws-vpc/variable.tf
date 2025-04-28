variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Maintainer = "Siddhartha"
    Terraform  = "true"
  }
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
  validation {
    condition = length (var.public_subnet_cidr) == 2
    error_message = "please provide 2 validate public CIDR"
  }
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidr" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
   validation {
    condition = length (var.private_subnet_cidr) == 2
    error_message = "please provide 2 validate public CIDR"
  }
  default     = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "database_subnet_cidr" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
   validation {
    condition = length (var.database_subnet_cidr) == 2
    error_message = "please provide 2 validate public CIDR"
  }
  default     = ["10.10.21.0/24", "10.10.22.0/24"]
}

variable "env" {
  description = "Deployment environment (e.g., DEV, STAGING, PROD)"
  type        = string
  default     = "DEV"
}

variable "igw_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
  default = {
    Name            = "Internet Gateway"
    Internet_Access = "true"
  }
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default = {
    Name            = "Public Subnet"
    Internet_Access = "true"
  }
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default = {
    Name            = "Private Subnet"
    Internet_Access = "true"
  }
}

variable "database_subnet_tags" {
  description = "Tags for database subnets"
  type        = map(string)
  default = {
    Name            = "Database Subnet"
    Internet_Access = "false"
  }
}

variable "nat_tags" {
  description = "Tags for the NAT Gateway"
  type        = map(string)
  default = {
    Name            = "NAT Gateway"
    Internet_Access = "true"
  }
}
variable "public_rt_tags" {
  default = {
    compount = "public subnet list"
  }
}

variable "private_rt_tags" {
  default = {
    compount = "private subnet list"
  }
}
variable "database_rt_tags" {
  default = {
    compount = "database subnet list"
  }
}
variable "enable_dns_hostnames" {
  default = true
}

variable "aws_db_subnet_group_rds" {
  default = {
    compount = "aws_db_subnet_group_rds"
  }
}
variable "is_vpc_peering_request" {
  default = true
}


variable "peering_tags" {
  default = {
    compount = "vpc peering to default"
  }
}
