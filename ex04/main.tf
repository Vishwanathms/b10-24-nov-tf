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

locals {
  tag_name = "${var.tag_env}-${var.region}"
}

resource "aws_instance" "instances2" {
  count = length(var.inst_config)
  ami = var.inst_config[count.index].ami
  subnet_id = "subnet-0d6ac36c57a9960b6"
  instance_type = var.inst_config[count.index].inst_type
  #tags = var.inst_config[count.index].tags
  tags = {
    Name = "${local.tag_name}-vm01"
  }
  monitoring = var.inst_config[count.index].monitoring
}

output "tag_name" {
  value = local.tag_name
}