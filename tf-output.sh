#!/bin/bash

cd Terraform
terraform output --json > ../test/devtest/files/terraform.json
echo "Terraform Output Copied to Inspec file"
