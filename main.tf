provider "aws" {

    access_key = "${var.aws_access_key}"

    secret_key = "${var.aws_secret_key}"

    region = "${var.region}"

}
 
module "temp_bucket" {
    source = "./temp_bucket"
    bucket_name = "meet-test-terraform"
}

module "ec2_instance" {
  source        = "./ec2_instance"
  region        = var.region
  ami           = "ami-079db87dc4c10ac91"  
  instance_type = "m5ad.2xlarge"
  key_name      = "my-ec2-key-pair"  
  instance_name = "my-ec2-instance"
  public_key_path = "~/.ssh/id_rsa.pub"  
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}

resource "local_file" "private_key_file" {
  content  = module.ec2_instance.private_key_file_content
  filename = "my-ec2-key-pair.pem"
}

module "iot_core"{
  source = "./iot_core"
  region = var.region
}