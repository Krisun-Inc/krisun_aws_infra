provider "aws" {
  region = var.region
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}


resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

# Port 22 for SSH
 
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = ["sg-077828eb90fd07e8b"]
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key_pair.id
  
  tags = {
    Name = var.instance_name
  }
}