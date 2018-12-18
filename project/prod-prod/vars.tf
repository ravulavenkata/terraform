//Constants related to this environment aka DEVELOPMENT 

/**************** ENVIRONMENT RELATED VARIABLES **********/
variable "environment" {
  default = "prod"
}

variable "default_region" {
  default = "us-east-1"
}

variable "disaster_recover_region" {
  default = "us-west-1"
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
