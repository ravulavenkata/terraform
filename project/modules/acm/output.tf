
output "aws_cetificate_arn_id" {
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.id}"  
}
/*
output "aws_certificate_fqdn" {
  description = "The FQDN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.fqdn}"  
}
*/

output "aws_cetificate_domain_validation_options" {  
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.domain_validation_options}"  
}

output "aws_cetificate_domain_validation_options_domain_name" {  
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.domain_validation_options.0.domain_name}"  
}

output "aws_cetificate_domain_validation_options_resource_record_name" {  
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"  
}

output "aws_cetificate_domain_validation_options_resource_record_type" {  
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"  
}

output "aws_cetificate_domain_validation_options_resource_record_value" {  
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"  
}