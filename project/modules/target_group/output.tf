
output "target_group_arn_id" {
  description = "The ID of the Target group"
  value       = "${aws_lb_target_group.secured_target_group.id}"  
}
