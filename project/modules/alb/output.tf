
output "aws_lb_arn_id" {
  description = "The ID of the load balancer group"
  value       = "${aws_lb.load_balancer.id}"  
}

output "aws_lb_dns_name" {
  description = "The DNS Name of the load balancer group"
  value       = "${aws_lb.load_balancer.dns_name}"  
}

output "aws_lb_zone_id" {
  description = "The Zone Id of the load balancer group"
  value       = "${aws_lb.load_balancer.zone_id}"  
}
