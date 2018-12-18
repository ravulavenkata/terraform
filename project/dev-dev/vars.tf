//Constants related to this environment aka DEVELOPMENT 

/**************** ENVIRONMENT RELATED VARIABLES **********/
variable "environment"                   {   default="dev"          }
variable "vpc_id"                        {   default="vpc-566ec02c" }
variable "default_region"                {   default = "us-east-1" }
variable "disaster_recover_region"       {   default = "us-west-1" }

/**************** EC2 INSTANCE **********/
variable "ec2_instance_key"              {   default = "string"     }
variable "ec2_instance_type"             {   default="t1.micro"     }

/**************** SECURITY GROUPS **********/
variable "secured_web_app_security_group_name"   {   default = "WebApp-Secured"     }

variable "secured_api_app_security_group_name"   {   default = "APIApp-Secured"     }

variable "secured_elasticache_security_group_name"   {   default = "ElastiCache-Secured"     }

variable "secured_rds_security_group_name"   {   default = "RDS-Secured"     }
