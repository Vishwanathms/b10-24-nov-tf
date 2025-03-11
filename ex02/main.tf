resource "aws_instance" "name" {
  count = var.noofec2
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  tags = {
    env = var.tag_env
    Name = var.names[count.index]
  }

}

variable "tag_env" {
  type = string
  description = "this is tag for env"
  default = "Dev"
}
variable "noofec2" {
  type = number
  default = 2
}

variable "names" {
  type = list 
  default = ["vm01", "vm02"]
}