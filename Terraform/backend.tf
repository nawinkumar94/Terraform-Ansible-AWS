terraform {
  backend "s3" {
    bucket  = "terraform-state-4294"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
