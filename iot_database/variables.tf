variable "cluster_identifier" {
  description = "A unique identifier for the Aurora cluster"
  default = "iot-databse"
}

variable "master_username" {
  description = "Username for the master user"
  default = "admin"
}

variable "master_password" {
  description = "Password for the master user"
  default = "Vancouver#2020"
}

variable "region" {
  description = "region of deployment"
  default = "us-east-1"
}