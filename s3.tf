resource "aws_s3_bucket" "bilatech_bucket" {
  bucket = var.my_app_s3_bucket
  acl    = "private"
  //region = var.region
  tags = {
    Name        = "bila-tech-dev"
    Environment = terraform.workspace
  }
}