## **Terraform-Ansible-AWS**
Framing a architecture using terraform and Configuring the architecture using Ansible

Vagrant-Terraform-Ansible-AWS-Project

## **About Vagrant**

Vagrant provides easy to configure, reproducible, and portable virtual machines
And it uses various technologies like VirtualBox,VMware and AWS as providers.

## **Vagrant Download and Setup**

1.Download the Vagrant package for windows

https://www.vagrantup.com/downloads

2.Run and Install the package

3.Navigate to Workspace and run the below command for Setting up.
  vagrant init

4.Check the output
"A Vagrantfile has been placed in this directory. You are now ready to vagrant up your first virtual environment!"

5.Open the Vagrantfile and remove unnecessary contents

6.Configure the Vagrantfile for Ubuntu Base Image
      Box: generic/ubuntu2004
      Hostname: devbox

7.Customize the Virtual Box and VM resources

## **About VirtualBox**

VirtualBox is a powerful virtualization product which has high performance and open source.
VirtualBox Download and Setup

1.Download and Install the Oracle VirtualBox
  https://www.virtualbox.org/

2.Check and Enable Virtualization in Windows Bios

3.Run below command in workspace.
  vagrant up

4.Open VirtualBox and DevBox should be up and running

5.SSH in to virtual environment "ssh vagrant@hostname -p port -i  private_key_file"

## **About Terraform**

Terraform is a tool used to Build,Configure and Version up the Infrastructure efficiently. Terraform uses the configuration files to build and manage the Infrastructure

## **About Ansible**

Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs. Ansible is Agent less and uses YAML syntax Ansible requires to be installed only in controller machine

## **Terraform and Ansible Installation in Dev Box[Ubuntu Image]**

1.Execute the provision.sh script with chmod 700 permission.
  sudo ./provision.sh

2.Check and confirm Terraform Installation.
  terraform --version

3.Check and confirm Ansible Installation.
  ansible --version

## **Infrastructure Build Automation with Terraform**

1.Navigate to terraform directory.
  cd Terraform

2.Format the terraform config files.
  terraform fmt

3.Validate the terraform configurations.
  terraform validate

4.Check the Plan of resources to be created by config files.
  terraform plan -out output.terraform

5.Apply the terraform config files
  terraform apply "output.terraform"

6.Approve the execution and resources will be created

## **Configuration Management Using Ansible**

1.Execute the ansible-setup.sh script with chmod 700 permission
  sudo ./ansible-setup.sh

2.Navigate to ansible folder.
  cd Ansible

3.Execute the ansible playbook
  ansible-playbook ansible/setup-app.yml

4.Ansible will fetch all the servers created by Terraform using dynamic inventory plugin and execute all the modules in the servers.

## **About Chef Inspec**

InSpec introduces the ability to test cloud resources for compliance in addition to the system and application-level resources

## **Automated Testing Using Inspec**

1.Automated Testing can be done using Inspec

2.For Installation,Execute the inspec-setup.sh script with chmod 700 permission
  sudo ./inspec-setup.sh

3.Setup the AWS Profile by Environment Variables or Configuration File

Export as Environment Variables

export AWS_ACCESS_KEY_ID="YOURAWSACCESSKEYHERE"

export AWS_SECRET_ACCESS_KEY="YOURAWSSECRETKEYHERE"

export AWS_REGION="REGIONHERE"

export AWS_AVAILABILITY_ZONE="AVAILABILITYZONEHERE"

Credentials in Config File

~/.aws/config and ~/.aws/credentials file

4.Make sure aws setup and credentials are set
  inspec detect -t aws://

5.For getting the infrastructure output from terraform,Execute tf-output.sh script with chmod 700 permission
  sudo ./tf-output.sh

6.Once the outputs are copied to inspec file,run below command to start the testcase in controls directory
  inspec exec test/devtest aws://

7.Testcase will be executed and results will be displayed

## **Test Infrastructure**

1.Get the Loadbalancer DNS

2.Launch It

3.Displays the "Hello, World! From Webserver ( ip of webserver)" with other details

4.Redirects traffic equally to webserver instances since Round Robin type

5.When removing one web server,loadbalancer redirects all the traffic to the other

## **Project Solution Summary**

Like

Two Tier Web application architecture is implemented

Complete VPC setup is done with Multiple AZs for Web Application

Execution steps are automated using simple Shell Scripts

DisLike

Need to reduce the time taken for automation

## **Tear Down Infrastructure**

1.Tear down Terraform infrastructure
  terraform destroy

2.Check whether all the resources are cleaned up in cloud

3.Tear Down the Vagrant to stop and continue after
  vagrant suspend
