terraform {
  required_version = "1.7.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


resource "aws_instance" "ec2_terraform" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}




