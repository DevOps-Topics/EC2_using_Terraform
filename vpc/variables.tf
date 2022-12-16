variable "vpc_cidr" {
  description = "cidr for terraform vpc"
  type = string
  default = 192.168.0.0/20

}
variable "my_vpc_tags" {
  description = "tags for terraform vpc"
  type = string
  default = terraform_vpc_tags

}

variable "vpc_id" {}

variable "subnet_cidr" {
  default = 172.0.1.0/24
}
