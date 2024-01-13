variable "region" {
  description = "AWS region"
}

variable "thing_name" {
  description = "name of esp32 thing attached"
  default     = "esp32-thing"
}

variable "polcy_name" {
  description = "name of esp32 policy attached"
  default     = "esp32-policy"
}