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
