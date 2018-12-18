resource "aws_lb" "load_balancer" {
  name               = "${var.load_balancer_name}"
  internal           = "${var.isInternal}"
  load_balancer_type = "${var.load_balancer_type}"
  security_groups    = ["${var.load_balancer_security_group_id}"]
  subnets            = [["${var.vpc_subnetIds}"]]

  enable_deletion_protection = "${var.enable_delete_protection}"

  
  tags = {
    Environment = "${var.load_balancer_name_tag}"
  }
}
