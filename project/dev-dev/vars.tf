//Constants related to this environment aka DEVELOPMENT 

//GLOBAL
variable "parent_domain_name" {
  default = "myinsiteapp.com"
}

variable "parent_domain_nameserver" {
  default = ["ns-1526.awsdns-62.org",
    "ns-842.awsdns-41.net",
    "ns-1897.awsdns-45.co.uk",
    "ns-82.awsdns-10.com",
  ]
}

/*************** ENVIRONMENT RELATED VARIABLES **********/
variable "environment" {
  default = "dev"
}

variable "default_region" {
  default = "us-east-1"
}

variable "disaster_recover_region" {
  default = "us-west-1"
}

/**************** CERTIFICATE - DOMAIN NAME **********/
variable "domain_name" {
  default = "dev.myinsiteapp.com"
}

/**************** VPC VIA VPC NAME HARDCODED **********/

variable "vpc_id" {
  default = ""
}

variable "vpc_name" {
  default = "default"
}

data "aws_vpc" "custom_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = "${data.aws_vpc.custom_vpc.id}"
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = "${data.aws_vpc.custom_vpc.id}"
}

data "aws_subnet" "all_private_subnets" {
  count = "${length(data.aws_subnet_ids.private_subnets.ids)}"
  id    = "${data.aws_subnet_ids.private_subnets.ids[count.index]}"
}

data "aws_subnet" "all_public_subnets" {
  count = "${length(data.aws_subnet_ids.public_subnets.ids)}"
  id    = "${data.aws_subnet_ids.public_subnets.ids[count.index]}"
}

output "aws_all_private_subnet_cidr_list" {
  description = "Display all private subnet CIDR List"
  value       = ["${data.aws_subnet.all_private_subnets.*.cidr_block}"]
}

output "aws_all_public_subnet_cidr_list" {
  description = "Display all public subnet CIDR List"
  value       = ["${data.aws_subnet.all_public_subnets.*.cidr_block}"]
}

output "aws_all_public_subnet_ids" {
  description = "Display all public subnet Ids"
  value       = ["${data.aws_subnet.all_public_subnets.*.id}"]
}

output "aws_all_private_subnet_ids" {
  description = "Display all private subnet Ids"
  value       = ["${data.aws_subnet.all_private_subnets.*.id}"]
}

/**************** SECURITY GROUPS **********/
variable "secured_web_app_security_group_name" {
  default = "WebApp-Secured"
}

variable "secured_api_app_security_group_name" {
  default = "APIApp-Secured"
}

variable "secured_elasticache_security_group_name" {
  default = "ElastiCache-Secured"
}

variable "secured_elasticache_security_group_from_port" {
  default = "6379"
}

variable "secured_elasticache_security_group_to_port" {
  default = "6379"
}

variable "secured_rds_security_group_name" {
  default = "RDS-Secured"
}

variable "secured_rds_security_group_from_port" {
  default = "443"
}

variable "secured_rds_security_group_to_port" {
  default = "443"
}

/**************** LOAD BALANCER **********/
variable "public_load_balancer_name" {
  default = "MyPublicALB"
}

/**************** EC2 INSTANCE **********/
variable "ec2_instance_key" {
  default = "MyDevKey"
}

variable "ec2_instance_type" {
  default = "t1.micro"
}

/**************** TARGET GROUP **********/

variable "target_group_name" {
  default = "Target-Group-Name"
}

variable "target_group_port" {
  default = "443"
}

/**************** LAUNCH CONFIGURATION **********/
variable "launch_config_name" {
  default = "UI-Launch-Config"
}
variable "launch_config_image_id" {
  default = "ami-0080e4c5bc078760e"
}
variable "launch_config_instance_type" {
  default = "t2.micro"
}
variable "launch_config_user_data" {
  default = ""
}
variable "launch_config_key_name" {
  default = ""
}


//ASG
variable "auto_scale_group_name" {default = "Web-UI-ASG-Group-Name"}
variable "asg_minimum_instances" {default = "1"}
variable "asg_maximum_instances" {default = "1"}

variable "asg_desired_capacity" {default="1"}
variable "asg_health_check_grace_period" {  default = "300" }
variable "asg_health_check_type" { default = "ELB" }
variable "asg_key" {  default = "ASGKEY"}
variable "asg_value" {  default = ""}
variable "asg_propagate_at_launch" {  default = ""}
variable "asg_create_before_destroy" {  default = ""}
variable "auto_scale_policy_name" {default=""}

