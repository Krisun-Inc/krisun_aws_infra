output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "private_key_file_content" {
  value = aws_key_pair.ec2_key_pair.public_key
}