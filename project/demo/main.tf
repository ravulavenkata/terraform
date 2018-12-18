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
  source                 = "../modules/alb/public"
  vpc_id                 = "${var.vpc_id}"
}
