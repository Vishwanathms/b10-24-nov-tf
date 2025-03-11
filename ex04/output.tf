output "pub_ip" {
  value = aws_instance.instances2[*].public_ip
}