# resource "aws_instance" "name" {
#   for_each = var.ec2_details
#   ami = var.ec2_ami[var.region]
#   subnet_id = each.value[0]
#   instance_type = each.value[1]
#   tags = {
#     env = each.value[2]
#     Name = each.key
#     Owner = each.value[3]
#   }
# }

data "aws_vpc" "get_vpc_id" {
  filter {
    name = "tag:Name"
    values = ["vpc_dev"]
  }
}

data "aws_subnets" "subnets_id" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.get_vpc_id.id]
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.subnets_id.ids)
  id       = each.value
}

locals {
  tag_name = "${var.tag_env}-${var.region}"
}

resource "aws_instance" "instances2" {
  count = var.creaet_vm ? length(var.inst_config) : 0 
  #count = length(var.inst_config)
  ami = var.inst_config[count.index].ami
  subnet_id = "subnet-0d6ac36c57a9960b6"
  instance_type = var.inst_config[count.index].inst_type
  #tags = var.inst_config[count.index].tags
  tags = {
    Name = "${local.tag_name}-vm01"
    Owner = "Vishwacloud"
  }
  monitoring = var.inst_config[count.index].monitoring
  #depends_on = [ aws_s3_bucket.s3rn ]
  # lifecycle {
  #   create_before_destroy = true
  #   prevent_destroy = true
  #   ignore_changes = [ instance_type  ]
  # }
}



output "tag_name" {
  value = local.tag_name
}

