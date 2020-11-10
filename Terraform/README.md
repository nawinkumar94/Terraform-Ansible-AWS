Terraform - Configurations

About Terraform
Terraform is a tool used to Build,Configure and Version up the Infrastructure efficiently.

Terraform uses the configuration files to build and manage the Infrastructure

Features of Terraform:

1.Infrastructure as Code

2.Execution Planning

3.Resource Graph

4.Changes by Automation

About Project
1.Creates a VPC and all its sub components

2.Creates a Load Balancer and Target Group

3.Lauches two ec2 instances and attaches to Target group

4.Load Balancer redirects traffic to each servers

5.Cloudwatch Log Group created for storing the log streams

System requirements
This version of packages and files was last tested on:

Virtual Box - Ubuntu 20.04 and Ubuntu WSL

Python 3.8

Infrastructure
AWS Cloud

Usage
1.To Intialize the terraform directory
  terraform init

2.To Format the Terraform Config files
  terraform fmt

3.To Validate the Terraform Config files
  terraform validate

4.To Get the Plan of Terraform Config files
  terraform plan -out output.terraform

5.To Execute the Terraform Config
  terraform apply "output.terraform"

6.To Destroy or bring down the infrastructure
  terraform destroy

Project Insider
Module: 1.application

Module: 2.configuration

Test Infrastructure:

1.After Ansible execution

2.Get the Loadbalancer DNS of Application instance

3.Launch It

4.Displays the "Hello, World! From Webserver ( ip of webserver) "

5.Navigate to "Loadbalancer DNS/info.php" to get more informations about webserver
