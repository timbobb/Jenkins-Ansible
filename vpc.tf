resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "bilatechvpc"
    Environment = "terraform.workspace"
    Location    = "Katy"
  }
}