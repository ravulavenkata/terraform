/**************** PARENT DOMAIN NAME **********/
/*

module "Parent_Domain_Register_Com" {
  source      = "../modules/route53/parent"
  parent_domain_name = "${var.parent_domain_name}"
  parent_domain_nameservers=
          [ "ns-93.awsdns-11.com",
            "ns-1255.awsdns-28.org",
            "ns-1613.awsdns-09.co.uk",
            "ns-820.awsdns-38.net"
          ]
}
*/
output "aws_route53_parent_domain_zone_id" {
  description = "Display all private subnet Ids"
  //value = "${module.Parent_Domain_Register_Com.aws_route53_parent_domain_zone_id}"
  value="Z3SRMW8N8CE0MA"
}


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

/**************** LOAD BALANCER LISTENER **********/
/*
module "Secured_Public_ALB_Listener" {
  source                    = "../modules/alb_listener"
  load_balancer_arn         = "${data.aws_vpc.custom_vpc.id}"
  listener_port             = "${var.public_load_balancer_name}-${var.environment}"
  listener_target_group_arn = "${var.public_load_balancer_name}-${var.environment}"
  certificate_arn           = "${var.public_load_balancer_name}-${var.environment}"
}

output "Secured_Public_ALB_Listener_ARN_Id" {
  value = "${module.Secured_Public_ALB_Listener.aws_lb_listerner_arn_id}"
}
*/
/**************** TARGET GROUP **********/

module "Secured_Target_Group" {
  source            = "../modules/target_group"
  vpc_id            = "${data.aws_vpc.custom_vpc.id}"
  target_group_name = "${var.target_group_name}-${var.environment}"
  target_group_port = "${var.target_group_port}"
}

output "Secured_Target_Group_ARN_Id" {
  value = "${module.Secured_Target_Group.target_group_arn_id}"
}

/**************** ACM **********/

module "Domain_Register_Com" {
  source      = "../modules/acm"
  domain_name = "${var.domain_name}"
  //route53_zone_id ="${module.Parent_Domain_Register_Com.aws_route53_parent_domain_zone_id}"
  route53_zone_id="Z3SRMW8N8CE0MA"
  domain_validation_options_resource_record_name="${module.Domain_Register_Com.aws_cetificate_domain_validation_options_resource_record_name}"
  domain_validation_options_resource_record_type="${module.Domain_Register_Com.aws_cetificate_domain_validation_options_resource_record_type}" 
  domain_validation_options_resource_record_value="${module.Secured_Public_ALB.aws_lb_arn_id}"
  certificate_arn="${module.Domain_Register_Com.aws_cetificate_arn_id}"  
}

output "Com_Domain_Certificate" {
  value = "${module.Domain_Register_Com.aws_cetificate_arn_id}"
}

output "aws_cetificate_domain_validation_options" {
  description = "The Domain Validation options for the certificate"
  value       = "${module.Domain_Register_Com.aws_cetificate_domain_validation_options}"  
}

output "aws_cetificate_domain_validation_options_domain_name" {  
  description = "The ARN ID of the certificate"
  value       = "${module.Domain_Register_Com.aws_cetificate_domain_validation_options_domain_name}"    
}

output "aws_cetificate_domain_validation_options_resource_record_name" {  
  description = "The ARN ID of the certificate"
  value       = "${module.Domain_Register_Com.aws_cetificate_domain_validation_options_resource_record_name}"    
}

output "aws_cetificate_domain_validation_options_resource_record_type" {  
  description = "The ARN ID of the certificate"
  value       = "${module.Domain_Register_Com.aws_cetificate_domain_validation_options_resource_record_type}"    
}

output "aws_cetificate_domain_validation_options_resource_record_value" {  
  description = "The ARN ID of the certificate"
  value       = "${module.Domain_Register_Com.aws_cetificate_domain_validation_options_resource_record_value}"    
}
/*
output "aws_certificate_fqdn" {
  description = "The FQDN of the certificate"
  value = "${module.Domain_Register_Com.aws_certificate_fqdn}"  
}
*/