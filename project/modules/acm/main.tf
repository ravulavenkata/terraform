
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
/*
resource "aws_route53_record" "cert_validation" {
  name    = "${var.domain_name}"
  type    = "CNAME"
  zone_id = "${var.route53_zone_id}"
  records = ["${var.domain_validation_options_resource_record_value}"]
  ttl     = 300
  depends_on = ["aws_acm_certificate.certificate"]
}

resource "aws_acm_certificate_validation" "cert" {  
  certificate_arn         = "${var.certificate_arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
  depends_on = ["aws_route53_record.cert_validation"]
}
*/