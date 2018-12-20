
resource "aws_lb_listener" "load_balancer_listener" {
  load_balancer_arn = "${var.load_balancer_arn}"
  port              = "${var.listener_port}"
  protocol          = "${var.listener_protocol}"
  ssl_policy        = "${var.listener_ssl_policy}"
  certificate_arn   = "${var.certificate_arn}"

  default_action {
    type             = "${var.listener_action}"
    target_group_arn = "${var.listener_target_group_arn}"
  }
}