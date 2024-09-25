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
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name = "iac-devrocha"
  tags = {
    Name = "primeira instancia terraform"
  }
}