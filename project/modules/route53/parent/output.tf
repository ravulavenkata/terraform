
output "aws_route53_parent_domain_zone_id" {
  description = "The Parent domain name"
  value       = "${aws_route53_zone.parent_domain.zone_id}"  
}