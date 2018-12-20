
output "aws_lb_listerner_arn_id" {
  description = "The ID of the load balancer listener"
  value       = "${aws_lb_listener.load_balancer_listener.id}"  
}
