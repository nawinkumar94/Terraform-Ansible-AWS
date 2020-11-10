
# outputs.tf

### Application Outputs ###

# Load Balancer DNS Output
output "loadbalancer_dns" {
  value       = module.application.loadbalancer_dns
  description = "Load Balancer DNS"
}

# Load Balancer ARN Output
output "loadbalancer_arn" {
  value       = module.application.loadbalancer_arn
  description = "Load Balancer ARN"
}

# Webserver1 Instance
output "Web_Server1" {
  value       = module.application.Web_Server1
  description = "Web_Server1 IP"
}

# Webserver2 Instance
output "Web_Server2" {
  value       = module.application.Web_Server2
  description = "Web_Server2 IP"
}

output "VPC" {
  value       = module.application.VPC
  description = "VPC Id"
}