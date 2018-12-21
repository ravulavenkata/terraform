//Constants related to this module only

/*** LAUNCH CONFIGURATION VARIABLES***/
variable "launch_config_name" {}

variable "launch_config_image_id" {default="ami-0080e4c5bc078760e"}

variable "launch_config_instance_type" {  default = "t1.micro" }

variable "launch_config_user_data" {  default = "" }

//variable "launch_config_depends_on" {}

variable "launch_config_key_name" {}
//variable "launch_config_security_groups" {}

//variable "launch_config_iam_instance_profile" {}

/*** AUTO SCALING GROUP VARIABLES *****/

variable "auto_scale_group_name" {}

variable "asg_minimum_instances" {default="1"}

variable "asg_maximum_instances" {  default = "10" }

variable "asg_desired_capacity" {default="1"}
variable "asg_vpc_zone_identifier" { type="list" default = [""] }

variable "asg_health_check_grace_period" {default = "300" }

variable "asg_health_check_type" {default = "ELB" }
variable "asg_target_group_arns" {type="list" default = [""]  }

variable "asg_key" {}
variable "asg_value" {}

variable "asg_propagate_at_launch" {  default = "true" }

variable "asg_create_before_destroy" {default=true}


/*** AUTO SCALING POLICY VARIABLES *****/

variable "auto_scale_policy_name" {}

variable "auto_scale_scaling_adjustment" {default = "4"}
variable "auto_scale_adjustment_type" {default="ChangeInCapacity"}

variable "auto_scale_cooldown" {default = "300"}

