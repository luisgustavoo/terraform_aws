locals {

  image_name = "dart.png"

  common_tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Luis Gustavo"
    UpdateAt    = "2024-01-28"
  }
}