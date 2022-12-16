resource "aws_vpc" "my_vpc" {
  cidr_block = "var.vpc_cidr"
  tags = {
  name = var.my_vpc_tags
  }
}
resource "aws_subnet" "my_vpc_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "Main"
  }
}

