//Constants related to this module only

variable "load_balancer_arn" {}

variable "listener_port" {}

variable "listener_protocol" {
  default = "HTTPS"
}

variable "listener_ssl_policy" {
  default = "ELBSecurityPolicy-2015-05"
}

variable "certificate_arn" {}

variable "listener_action" {
  default = "forward"
}

variable "listener_target_group_arn" {}
