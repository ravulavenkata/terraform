//Constants related to this module only

variable "target_group_name" {}
variable "target_group_port" {}
variable "target_group_protocol" { default="HTTPS"}
variable "vpc_id" {}
variable "health_check_interval" {default="30"}
variable "health_check_path" {default="/"}
variable "health_check_port" {default="traffic-port"}
variable "health_check_healthy_threshold" {default="3"}
variable "health_check_unhealthy_threshold" {default="3"}
variable "health_check_timeout" {default="5"}
variable "health_check_protocol" {default="HTTPS"}
variable "health_check_matcher" {default="200"}
