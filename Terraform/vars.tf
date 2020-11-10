variable AWS_REGION{
  default = "us-east-1"
}

variable "INSTANCE_TYPE"{
  default = "t2.micro"
}

variable "PATH_TO_PUBLICKEY"{
  default = "mykeypair.pub"
}

variable PATH_TO_PRIVATE_KEY{
  default = "mykey"
}

variable AMIS {
  type= map(string)
  default = {
    ap-south-1 = "ami-04d8d4462ae1ae813"
    ap-northeast-1 = "ami-036cb77005c69fbe0"
    us-east-1 = "ami-00514a528eadbc95b"
  }
}

variable "CIDR_BLOCK_16"{
  default = "10.0.0.0/16"
}

variable "CIDR_BLOCK_0"{
  default = "0.0.0.0/0"
}
