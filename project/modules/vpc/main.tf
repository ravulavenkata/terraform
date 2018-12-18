resource "aws_security_group" "https_secured_security_group" {
  name        = "${var.security_group_name}"
  description = "Allow all inbound/outbound traffic to the server only on 443 port"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "${var.secured_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "${var.secured_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.secured_security_group_tag}"
  }
}
