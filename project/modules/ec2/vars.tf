//Constants related to this module only
variable "security_group_name" {}

variable "vpc_id" {}

variable "secured_protocol" {
  default = "tcp"
}

variable "secured_security_group_tag" {}
