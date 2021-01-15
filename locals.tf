locals {
  vpc_name = terraform.workspace == "dev" ? "bilatech-dev" : "bilatech-prod"
}