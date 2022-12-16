resource "aws_instance" "ec2_public" {
  ami                         = 
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = var.vpc.public_subnets[0]
  vpc_security_group_ids      = [var.sg_pub_id]
 

We are going to create modueles for above file

Module EC2
main.tf
resource "aws_instance" "ec2_public" {
  name 		   	      = "Terraform instance"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = var.vpc.public_subnets[0]
  vpc_security_group_ids      = [var.sg_pub_id]

 tags = {
    Terraform   = "true"
    Environment = "Dev"
  }

Module networking
main.tf

resource "vpc" "vpc_public" {
  name            = "my-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway  = false
  tags = {
  Terraform     = "true"
  Environment   = "dev"
  }

resource "aws_security_group" "allow_ssh_pub" {
  name        = "SSH-terraform"
  description = "Allow SSH inbound traffic"
  vpc_id      = vpc.vpc_id

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "HHTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "HTTPS from the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = True
  }
}
}
