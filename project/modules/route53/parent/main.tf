
/*data "aws_acm_certificate" "example" {
  domain      = "${var.domain_name}"
  types       = "${var.acm_issued}"
  ["AMAZON_ISSUED"]
  most_recent = true
}
*/
resource "aws_route53_zone" "parent_domain" {
  name = "${var.parent_domain_name}"  
}
  resource "aws_route53_record" "parent_domain-ns" {
  zone_id = "${aws_route53_zone.parent_domain.zone_id}"
  name    = "${var.parent_domain_name}"  
  type    = "NS"
  ttl     = "30"

  records = "${var.parent_domain_nameservers}",
}

