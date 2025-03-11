variable "tag_env" {
  type = string
  description = "this is tag for env"
  default = "Dev"
}

variable "region" {
    default = "us-east-1"
}
/*variable "noofec2" {
  type = number
  default = 2
}

ariable "names" {
  type = list 
  default = ["vm01", "vm02"]
}

variable "subnets" {
  type = list 
  default = ["sub-12345", "sub-6789"]
}*/

variable "ec2_ami" {
    type = map(string)
    default = {
      "us-east-1" = "ami-05b10e08d247fb927"
      "us-east-2" = "ami-05b10e08d24709877"
    }
}


variable "ec2_details" {
    type = map(list(string))
    default = {
      "vm01" = ["sub-12345", "t2.micro", "dev", "Vishwa" ]
      "vm02" = ["sub-6789", "t2.medium", "dev", "Someone" ]
    }
}

variable "ex_tuple" {
  type = tuple([string, number, bool])
  default = [ "sub-12345", 2, false ] 
}

variable "inst_config" {
    type = list(object({
      name = string
      inst_type = string 
      ami = string 
      tags = map(string)
      monitoring = bool
    }))
    default = [
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
        inst_type = "t2.medium"
        name = "Vm02"
        tags = {
            Env = "dev"
            Owner = "Vishwa"
            Name = "Vm02"
        }
        monitoring = true
        }
    ]
  
}