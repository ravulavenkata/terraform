
output "aws_cetificate_arn_id" {
  description = "The ARN ID of the certificate"
  value       = "${aws_acm_certificate.certificate.id}"  
}
