provider "aws" {
  region = "us-east-1"
  profile = "dl-eks-01"
}

resource "aws_instance" "name" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  
}