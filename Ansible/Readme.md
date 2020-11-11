## **Ansible-Configurations**

## **About Ansible**

Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs. Ansible is Agent less and uses YAML syntax Ansible requires to be installed only in controller machine

## **About Project**

1.Installs Apache, PHP and Python modules to the host machines

2.Uses Dynamic inventory with Ansible plugin to fetch the server details

3.Executes the playbook for all the hosts

## **About Project**

This version of playbooks and roles was last tested on:

Virtual Box - Ubuntu 20.04 and Ubuntu 20.04 WSL

Python 3.8

Ansible 2.9

## **Infrastructure**

AWS Cloud

## **Development Environment**

Ubuntu 20.04 Box as Ansible Controller

## **Usage**

1.Execute the below script with chmod 700 permission

ansible-setup.sh

2.Change directory to Ansible and Execute the Playbook

ansible-playbook ansible/setup-app.yml

## **Project Insider**
Role: webservers: A role to install Python, Php and Apache and configure the webservers.

Playbook: setup-app.yml: Configure the webservers with roles

Inventory: hosts.aws_ec2.yaml: Fetch the webserver instances based on the filter parameter specified also mentioned the hostname to ssh,
                               keyed_groups to group the webservers based on the tags.
