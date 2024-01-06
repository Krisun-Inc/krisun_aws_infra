provider "aws" {

    access_key = "${var.aws_access_key}"

    secret_key = "${var.aws_secret_key}"

    region = "${var.region}"

}

module "temp_bucket" {
    source = "./temp_bucket"
    bucket_name = "meet-test-terraform"
}


