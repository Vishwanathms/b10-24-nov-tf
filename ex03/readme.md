## Terraform variables

* problem statement 
-- we need multiple list variables to be called together, holding different values

* Solution -- MAPS

### Scenario-1

* map(string)
```
    default = {
      "vm01" = "sub-12345"
      "vm02" = "sub-6789"
    }
```
Note: "vm01" is hte key and "sub-12345" is the vlaue.

### Scenario-2

* map(list(string))
```
    default = {
      "vm01" = ["sub-12345", "t2.micro", "dev", "Vishwa" ]
      "vm02" = ["sub-6789", "t2.medium", "dev", "Someone" ]
    }
```

### Scenario-3
* how to use multiple regions in the same terraform script
```
variable "ec2_ami" {
    type = map(string)
    default = {
      "us-east-1" = "ami-05b10e08d247fb927"
      "us-east-2" = "ami-05b10e08d24709877"
    }
}
......
resource "aws_instance" "name" {
  for_each = var.ec2_details
  ami = var.ec2_ami[var.region]

```

### tuple 
```
variable "ex_tuple" {
  type = tuple([string, number, bool])
  default = [ "sub-12345", 2, false ] 
}
```

### Objects
Note: this is for single object 
```
variable "inst_config" {
    type = object({
      name = string
      inst_type = string 
      ami = string 
      tags = map(string)
      monitoring = bool
    })
    default = {
      ami = "ami-05b10e08d247fb927"
      inst_type = "t2.micro"
      name = "Vm01"
      tags = {
        Env = "dev"
        Owner = "Vishwa"
        Name = "Vm01"
      }
    }
  
}
```
```
resource "aws_instance" "instances2" {
  ami = var.inst_config.ami
  subnet_id = each.value[0]
  instance_type = var.inst_config.inst_type
  tags = var.inst_config.tags
}
```