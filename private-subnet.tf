
locals {
  pri_sub_ids = aws_subnet.private.*.id
}
resource "aws_subnet" "private" {
  count             = length(slice(local.az_names, 0, 2))
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(local.az_names))
  availability_zone = local.az_names[count.index]
  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}

resource "aws_instance" "nat" {
  ami                    = var.nat_amis[var.region]
  instance_type          = "t3.micro"
  subnet_id              = local.pub_sub_ids[0]
  source_dest_check      = false
  vpc_security_group_ids = [aws_security_group.nat_sg.id]
  tags = {
    Name = "BilatechNat"
  }
}

resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat.id
  }

  tags = {
    Name = "biltechPRT"
  }
}

resource "aws_route_table_association" "pri_rt_association" {
  count          = length(slice(local.az_names, 0, 2))
  subnet_id      = local.pri_sub_ids[count.index]
  route_table_id = aws_route_table.privatert.id
}

resource "aws_security_group" "nat_sg" {
  name        = "nat_sg"
  description = "Allow traffic for private subnets"
  vpc_id      = aws_vpc.main_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nat_sg"
  }
}