
/*data "aws_acm_certificate" "example" {
  domain      = "${var.domain_name}"
  types       = "${var.acm_issued}"
  ["AMAZON_ISSUED"]
  most_recent = true
}
*/
resource "aws_acm_certificate" "certificate" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"

  tags = {
    Environment = "${var.domain_name}"
  }
}

resource "aws_route53_record" "cert_validation" {
  name    = "${var.domain_validation_options_resource_record_name}"
  type    = "CNAME"
  zone_id = "${var.route53_zone_id}"
  records = ["${var.domain_validation_options_resource_record_value}"]
  ttl     = 300
  depends_on = ["aws_acm_certificate.certificate"]
}

resource "aws_route53_record" "domain_name_validation_alias_route53_record" {
  depends_on = ["aws_acm_certificate.certificate"]
  zone_id = "${var.route53_zone_id}"
  name    = "${var.domain_name}"
  type    = "A"
  
  alias {
    name    = "${var.load_balancer_dns_name}"
    zone_id = "${var.load_balancer_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate_validation" "cert" {  
  certificate_arn         = "${var.certificate_arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
  depends_on = ["aws_route53_record.cert_validation"]
}
