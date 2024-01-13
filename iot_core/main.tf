provider "aws" {
  region = var.region
}

resource "aws_iot_policy" "esp32_policy" {
  name        = var.polcy_name
  policy      = file("${path.module}/policy.json")
}

resource "aws_iot_certificate" "esp32_certificate" {
  active = true
}

resource "aws_iot_policy_attachment" "esp32_policy_attachment" {
  policy = aws_iot_policy.esp32_policy.name
  target     = aws_iot_certificate.esp32_certificate.arn
}

resource "aws_iot_thing" "esp32_thing" {
  name = var.thing_name
}

resource "aws_iot_thing_principal_attachment" "esp32_principal_attachment" {
  principal  = aws_iot_certificate.esp32_certificate.arn
  thing = aws_iot_thing.esp32_thing.name
}