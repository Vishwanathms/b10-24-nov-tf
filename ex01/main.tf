

resource "aws_instance" "name" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"

}

resource "azurerm_virtual_network" "vnet01" {
  location = "East US"
  resource_group_name = "rg01"
  name = "vnet01"
  address_space = [ "10.10.0.0/20" ]
}