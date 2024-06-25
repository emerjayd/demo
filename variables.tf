variable "aws_region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "eu-west-2"
}

variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
  sensitive   = true
}

variable "instance_size_type" {
  description = "Map of instance sizes"
  type        = map(string)
  default     = {
    dev  = "t2.micro"
    prod = "t2.medium"
  }
}

variable "test_environment" {
  description = "Test environment flag (y/n)"
  type        = string
  default     = "n"
}

variable "all_ip_cidr" {
  description = "CIDR block to allow all IPs"
  type        = string
  default     = "0.0.0.0/0"
}

variable "list_of_ports" {
  description = "List of ports to allow"
  type        = list(number)
  default     = [22, 80, 443]
}
