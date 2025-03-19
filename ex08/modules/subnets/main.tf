data "aws_vpc" "get_vpc_id" {
  filter {
    name = "tag:Name"
    values = ["vpc_dev"]
  }
}

resource "aws_subnet" "Subnew01" {
    vpc_id = data.aws_vpc.get_vpc_id.id
    cidr_block = var.cidr_block

}

variable "cidr_block" {}

output "subnet_id1" {
  value = aws_subnet.Subnew01.id
}