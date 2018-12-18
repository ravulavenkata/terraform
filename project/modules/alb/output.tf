
output "aws_lb_id" {
  description = "The ID of the load balancer group"
  value       = "${aws_lb.load_balancer.id}"  
}
