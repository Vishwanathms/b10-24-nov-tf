provider "aws" {
  region = "us-east-1"
  profile = "default"
}

module "vm01" {
  source = "./modules/ec2"
  owner_tag = "Vishwa"
  tag_env = "Dev"
  creaet_vm = true
  region = "us-east-1"
  subnet_id = module.newsubnet.subnet_id1
  inst_config = [
        {
        ami = "ami-05b10e08d247fb927"
        inst_type = "t2.micro"
        name = "Vm01"
        tags = {
            Env = "dev"
            Owner = "Vishwa"
            Name = "Vm01"
        }
        monitoring = true
        }
    ]
}

module "newsubnet" {
  source = "./modules/subnets"
  cidr_block = "192.168.2.0/24"
}