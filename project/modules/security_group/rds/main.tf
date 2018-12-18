resource "aws_security_group" "secured_rds_security_group" {
  name        = "${var.security_group_name}"
  description = "Allow all inbound/outbound traffic to the relational database only on 443 port"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.from_port}"
    to_port     = "${var.to_port}"
    protocol    = "${var.secured_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "${var.from_port}"
    to_port     = "${var.to_port}"
    protocol    = "${var.secured_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.secured_security_group_tag}"
  }
}
