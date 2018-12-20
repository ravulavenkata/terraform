//Constants related to this module only
/*
data "aws_acm_certificate" "example" {
  domain      = "${var.domain_name}"
  types       = "${var.acm_issued}"
  most_recent = true
}
*/
variable "domain_name" {}

variable "acm_issued" {default="AMAZON_ISSUED"}

variable "validation_method" {  default = "DNS" }

variable "certificate_tag" {  default = "DNS" }

variable "certificate_arn" {}

//variable "aws_route53_record_cert_validation_fqdn" {}
variable "domain_validation_options_resource_record_name" {}
variable "domain_validation_options_resource_record_type" {}

variable "domain_validation_options_resource_record_value" {}

variable "route53_zone_id" {}
