//Constants related to this module only

variable "domain_name" {}

variable "acm_issued" {default="AMAZON_ISSUED"}

variable "validation_method" {
  default = "DNS"
}

variable "certificate_tag" {  default = "DNS" }

variable "load_balancer_dns_name" {}
