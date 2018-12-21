resource "aws_launch_configuration" "launch_config" 
{
  lifecycle { create_before_destroy=true  }
  name          = "${var.launch_config_name}"
  image_id      = "${var.launch_config_image_id}"
  instance_type = "${var.launch_config_instance_type}"
  //user_data ="${var.launch_config_user_data}"
  //depends_on="${var.launch_config_depends_on}"
  key_name="${var.launch_config_key_name}"
  //security_groups="${var.launch_config_security_groups}"
  //iam_instance_profile="${var.launch_config_iam_instance_profile}"

}


resource "aws_autoscaling_group" "auto_scale" {
  depends_on = ["aws_launch_configuration.launch_config"]
  name                 = "${var.auto_scale_group_name}"
  launch_configuration = "${var.launch_config_name}"
  min_size             = "${var.asg_minimum_instances}"
  max_size             = "${var.asg_maximum_instances}"
  desired_capacity     = "${var.asg_desired_capacity}"
  vpc_zone_identifier  = ["${var.asg_vpc_zone_identifier}"]
  health_check_grace_period="${var.asg_health_check_grace_period}"
  health_check_type="${var.asg_health_check_type}"
  target_group_arns=["${var.asg_target_group_arns}"]
  force_delete=true
  tag{
    key="${var.asg_key}"
    value="${var.asg_value}"
    propagate_at_launch=true
  }


  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "auto_scale_policy" {
  depends_on = ["aws_autoscaling_group.auto_scale"]
  name                   = "${var.auto_scale_policy_name}"
  scaling_adjustment     = "${var.auto_scale_scaling_adjustment}"
  adjustment_type        = "${var.auto_scale_adjustment_type}"
  cooldown               = "${var.auto_scale_cooldown}"
  autoscaling_group_name = "${var.auto_scale_group_name}"
}

