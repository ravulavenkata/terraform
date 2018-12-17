module "Secured_Webapp_Security_Group"{
    source="../modules/security_group"
    vpc_id="${var.vpc_id}"
    security_group_name="${var.secured_web_app_security_group_name}-${var.environment}"
    secured_security_group_tag="${var.secured_web_app_security_group_name}-${var.environment}"
}


module "Secured_Internal_App_Security_Group"{
    source="../modules/security_group"
    vpc_id="${var.vpc_id}"
    security_group_name="${var.secured_api_app_security_group_name}-${var.environment}"
    secured_security_group_tag="${var.secured_api_app_security_group_name}-${var.environment}"
}

