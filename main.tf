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
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "br-dev-luisgustavo-my-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Luis Gustavo"
    UpdateAt    = "2024-01-28"
  }
}

resource "aws_s3_bucket_ownership_controls" "my-test-bucket-controls" {
  bucket = aws_s3_bucket.my-test-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my-test-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.my-test-bucket-controls]

  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}