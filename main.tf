terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "ec2_demo" {
  ami                    = data.aws_ami.latest_ami_id.id
  instance_type          = var.instance_size_type["prod"]
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  count                  = lower(var.test_environment) == "y" ? 1 : 5

  tags = {
    Name = "web_server_${count.index}"
  }
}

resource "aws_eip" "instance_ip_address" {
  count  = lower(var.test_environment) == "y" ? 1 : 5
  domain = "vpc"
}

resource "aws_eip_association" "aws_eip_assoc" {
  count          = lower(var.test_environment) == "y" ? 1 : 5
  instance_id    = aws_instance.ec2_demo[count.index].id
  allocation_id  = aws_eip.instance_ip_address[count.index].id
}
