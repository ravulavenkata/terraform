resource "aws_lb_target_group" "secured_target_group" {
  name     = "${var.target_group_name}"
  port     = "${var.target_group_port}"
  protocol = "${var.target_group_protocol}"
  vpc_id   = "${var.vpc_id}"
  health_check{
    interval="${var.health_check_interval}"
    path="${var.health_check_path}"
    port="${var.health_check_port}"
    healthy_threshold="${var.health_check_healthy_threshold}"
    unhealthy_threshold="${var.health_check_unhealthy_threshold}"
    timeout="${var.health_check_timeout}"
    protocol="${var.health_check_protocol}"
    matcher="${var.health_check_matcher}"

  }
}
