/**************** SECURITY GROUPS **********/

module "Secured_Webapp_Security_Group" {
  source                     = "../modules/security_group/ec2"
  vpc_id                     = "${var.vpc_id}"
  security_group_name        = "${var.secured_web_app_security_group_name}-${var.environment}"
  secured_security_group_tag = "${var.secured_web_app_security_group_name}-${var.environment}"
}

module "Secured_Internal_App_Security_Group" {
  source                     = "../modules/security_group/ec2"
  vpc_id                     = "${var.vpc_id}"
  security_group_name        = "${var.secured_api_app_security_group_name}-${var.environment}"
  secured_security_group_tag = "${var.secured_api_app_security_group_name}-${var.environment}"
}

module "Secured_ElastiCache_Security_Group" {
  source                     = "../modules/security_group/elasticache"
  vpc_id                     = "${var.vpc_id}"
  security_group_name        = "${var.secured_elasticache_security_group_name}-${var.environment}"
  secured_security_group_tag = "${var.secured_elasticache_security_group_name}-${var.environment}"
  from_port                  = "${var.secured_elasticache_security_group_from_port}"
  to_port                    = "${var.secured_elasticache_security_group_to_port}"
}

module "Secured_RDS_Security_Group" {
  source                     = "../modules/security_group/rds"
  vpc_id                     = "${var.vpc_id}"
  security_group_name        = "${var.secured_rds_security_group_name}-${var.environment}"
  secured_security_group_tag = "${var.secured_rds_security_group_name}-${var.environment}"
  from_port                  = "${var.secured_rds_security_group_from_port}"
  to_port                    = "${var.secured_rds_security_group_to_port}"
}

output "Secured_Internal_App_Security_Group_Id" {
  value = "${module.Secured_Internal_App_Security_Group.security_group_id}"
}

output "Secured_Webapp_Security_Group_Id" {
  value = "${module.Secured_Webapp_Security_Group.security_group_id}"
}

output "Secured_ElastiCache_Security_Group_Id" {
  value = "${module.Secured_ElastiCache_Security_Group.security_group_id}"
}

output "Secured_RDS_Security_Group_Id" {
  value = "${module.Secured_RDS_Security_Group.security_group_id}"
}

/**************** LOAD BALANCER **********/

module "Secured_Public_ALB" {
  source                          = "../modules/alb"
  vpc_id                          = "${data.aws_vpc.custom_vpc.id}"
  load_balancer_name              = "${var.public_load_balancer_name}-${var.environment}"
  load_balancer_name_tag          = "${var.public_load_balancer_name}-${var.environment}"
  access_log_bucket_name          = "${var.public_load_balancer_name}-${var.environment}"
  access_log_prefix               = "${var.public_load_balancer_name}-${var.environment}"
  load_balancer_security_group_id = "${module.Secured_Webapp_Security_Group.security_group_id}"
  vpc_subnetIds                   = ["${data.aws_subnet.all_public_subnets.*.id}"]
}

output "Public_ALB_ARN_Id" {
  value = "${module.Secured_Public_ALB.aws_lb_arn_id}"
}

/**************** TARGET GROUP **********/

module "Secured_Target_Group" {
  source                          = "../modules/target_group"
  vpc_id                          = "${data.aws_vpc.custom_vpc.id}"
  target_group_name              = "${var.target_group_name}-${var.environment}"
  target_group_port          = "${var.target_group_port}"
 
}

output "Secured_Target_Group_ARN_Id" {
  value = "${module.Secured_Target_Group.target_group_arn_id}"
}
