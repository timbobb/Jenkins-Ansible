variable "vpc_cidr" {
  description = "choose cidr of vpc"
  type        = string
  default     = "100.40.0.0/16"
}

variable "region" {
  description = "Choose region for your stack"
  type        = string
  default     = "us-east-1"
}

variable "web_ec2_count" {
  description = "Choose ec2 instances for your web"
  type        = string
  default     = "2"
}

variable "nat_amis" {
  description = "Choose nat instance for your stack"
  type        = map(any)
  default = {
    us-east-1 = "ami-0885b1f6bd170450c"
    us-east-2 = "ami-0a91cd140a1fc148a"
  }
}

variable "my_app_s3_bucket" {
  default = "bila-tech-dev"
}
variable "web_instance_type" {
  description = "Choose instance type for your stack"
  type        = string
  default     = "t2.micro"
}

variable "web_tags" {
  type = map(any)
  default = {
    Name = "Webserver"
  }
}

variable "web_amis" {
  description = "Choose nat instance for your stack"
  type        = map(any)
  default = {
    us-east-1 = "ami-0885b1f6bd170450c"
    us-east-2 = "ami-0a91cd140a1fc148a"
  }
}