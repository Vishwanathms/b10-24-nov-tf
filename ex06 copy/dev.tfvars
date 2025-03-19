tag_env = "Dev"
creaet_vm = true
region = "us-east-1"
ec2_ami = {
      "us-east-1" = "ami-05b10e08d247fb927"
      "us-east-2" = "ami-05b10e08d24709877"
    }
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
        },
        {
        ami = "ami-05b10e08d247fb927"
        inst_type = "t3.medium"
        name = "Vm02"
        tags = {
            Env = "dev"
            Owner = "Vishwa"
            Name = "Vm02"
        }
        monitoring = true
        }
    ]