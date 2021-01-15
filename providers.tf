provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "terraformstatebucket628"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "javahome-tf"
  }
}


output "vpc_cidr" {
  value = aws_vpc.main_vpc.id
}

