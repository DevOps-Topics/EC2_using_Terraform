modules/vpc/networking.tf

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



modules/vpc/variables.tf

variable "vpc_cidr" {
  description = "cidr for terraform vpc"
  type = string
  default = 172.0.0.0/20

}
variable "terraform_vpc_tags" {
  description = "tags for terraform vpc"
  type = string
  default = terraform_vpc_tags

}

variable "vpc_id" {
  default = aws_vpc.myvpc.id
}

variable "subnet_cidr" {
  default = 172.0.1.0/24
}




