
# outputs.tf

### Application Outputs ###

# Load Balancer DNS Output
output "loadbalancer_dns" {
  value       = aws_lb.webserver_lb.dns_name
  description = "Load Balancer DNS"
}

# Load Balancer ARN Output
output "loadbalancer_arn" {
  value       = aws_lb.webserver_lb.arn
  description = "Load Balancer ARN"
}

# Webserver1 Instance
output "Web_Server1" {
  value       = aws_instance.webserver1.public_ip
  description = "Web_Server1 IP"
}

# Webserver2 Instance
output "Web_Server2" {
  value       = aws_instance.webserver2.public_ip
  description = "Web_Server2 IP"
}
