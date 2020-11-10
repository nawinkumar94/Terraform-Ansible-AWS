data "aws_vpc" "main_vpc"{
  cidr_block  = var.CIDR_BLOCK_16
  tags = {
    Name      = "main_vpc"
  }
  depends_on  = [var.VPC_ID]
}

data "aws_subnet" "public_subnet1"{
  vpc_id    = data.aws_vpc.main_vpc.id
  tags = {
    Name    = "MainSubnetPubicId_1"
  }
}

data "aws_subnet" "public_subnet2"{
  vpc_id    = data.aws_vpc.main_vpc.id
  tags = {
    Name    = "MainSubnetPubicId_2"
  }
}

resource "aws_instance" "webserver1"{
  ami                    = lookup(var.AMIS,var.AWS_REGION)
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_access.id]
  subnet_id              = data.aws_subnet.public_subnet1.id
  key_name               = aws_key_pair.mykey.key_name
  tags = {
    Name = "webserver"
  }
}

resource "aws_instance" "webserver2"{
  ami                    = lookup(var.AMIS,var.AWS_REGION)
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_access.id]
  subnet_id              = data.aws_subnet.public_subnet2.id
  key_name               = aws_key_pair.mykey.key_name
  tags = {
    Name = "webserver"
  }
}

resource "aws_key_pair" "mykey"{
  key_name   = "mykeypair"
  public_key = file(var.PATH_TO_PUBLICKEY)
}

resource "aws_security_group" "allow_access"{
  name   = "allow-access"
  vpc_id = data.aws_vpc.main_vpc.id
  ingress{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks =[var.CIDR_BLOCK_0] //Need to give home network
  }
  ingress{
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_lb.id]
  }
  egress{
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.CIDR_BLOCK_0]
  }
  tags = {
    Name  = "allow-access"
  }
}

resource "aws_lb" "webserver_lb"{
  name               = "webserver-lb"
  load_balancer_type = "application"
  security_groups    =[aws_security_group.allow_lb.id]
  subnets            =[data.aws_subnet.public_subnet1.id,data.aws_subnet.public_subnet2.id]
  tags = {
    Name  = "webserver-loadbalancer"
  }
}

resource "aws_lb_target_group" "webserver_lb_group"{
  name     = "webserver-lb-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
  tags = {
    Name  = "webserver-target_group"
  }
}

resource "aws_lb_target_group_attachment" "webserver_lb_attach"{
  target_group_arn = aws_lb_target_group.webserver_lb_group.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "webserver_lb_attach1"{
  target_group_arn = aws_lb_target_group.webserver_lb_group.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}


resource "aws_lb_listener" "webserver_lb_listener"{
  load_balancer_arn   = aws_lb.webserver_lb.arn
  port                = 80
  protocol            = "HTTP"
  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.webserver_lb_group.arn
  }
}

resource "aws_security_group" "allow_lb"{
  name    = "allow-security"
  vpc_id  = data.aws_vpc.main_vpc.id
  ingress{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.CIDR_BLOCK_0]
  }
  ingress{
    from_port   = 443
    to_port     = 443
    protocol    ="tcp"
    cidr_blocks = [var.CIDR_BLOCK_0]
}
egress{
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks =[var.CIDR_BLOCK_0]
}
}
