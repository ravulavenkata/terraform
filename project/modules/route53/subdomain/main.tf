
/*data "aws_acm_certificate" "example" {
  domain      = "${var.domain_name}"
  types       = "${var.acm_issued}"
  ["AMAZON_ISSUED"]
  most_recent = true
}
*/
rresource "aws_route53_zone" "main" {
  name = "example.com"
}

resource "aws_route53_zone" "dev" {
  name = "dev.example.com"

  tags = {
    Environment = "dev"
  }
}