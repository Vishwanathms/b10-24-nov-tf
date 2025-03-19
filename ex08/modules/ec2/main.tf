locals {
  tag_name = "${var.tag_env}-${var.region}"
}

resource "aws_instance" "instances2" {
  count = var.creaet_vm ? length(var.inst_config) : 0 
  #count = length(var.inst_config)
  ami = var.inst_config[count.index].ami
  #subnet_id = "subnet-0d6ac36c57a9960b6"
  subnet_id = var.subnet_id
  instance_type = var.inst_config[count.index].inst_type
  #tags = var.inst_config[count.index].tags
  tags = {
    Name = "${local.tag_name}-vm01"
    Owner = var.owner_tag
  }
  monitoring = var.inst_config[count.index].monitoring
  #depends_on = [ aws_s3_bucket.s3rn ]
  # lifecycle {
  #   create_before_destroy = true
  #   prevent_destroy = true
  #   ignore_changes = [ instance_type  ]
  # }
}

variable "tag_env" {
  type = string
  description = "this is tag for env"
  #default = "Dev"
}

variable "creaet_vm" {}

variable "region" {
    #default = "us-east-1"
}

variable "ec2_ami" {
    type = map(string)
    default = {
      "us-east-1" = "ami-05b10e08d247fb927"
      "us-east-2" = "ami-05b10e08d24709877"
    }
}

variable "inst_config" {
    type = list(object({
      name = string
      inst_type = string 
      ami = string 
      tags = map(string)
      monitoring = bool
    }))

}

variable "subnet_id" {}
variable "owner_tag" {}