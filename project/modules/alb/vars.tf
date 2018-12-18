//Constants related to this module only
variable "load_balancer_name" {}

variable "vpc_id" {}

variable "load_balancer_type" {
  default = "application"
}

variable "isInternal" {
  default = "false"
}

variable "enable_delete_protection" {
  default = "false"
}

variable "access_log_bucket_name" {}
variable "access_log_prefix" {}

variable "access_logs_enabled" {
  default = "false"
}

variable "load_balancer_name_tag" {}

variable "load_balancer_security_group_id" {}

variable vpc_subnetIds {  type = "list"}