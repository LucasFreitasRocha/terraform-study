terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  profile = "devrocha"
  region  = var.region_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = var.type_instance
  key_name =  var.key
  vpc_security_group_ids = [aws_security_group.geral_acess.id]
  tags = {
    Name = "terraform ansible python"
  }
}

resource "aws_key_pair" "keySSH" {
  key_name  = var.key
  public_key = file("${var.key}.pub")
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}