Here is a Terraform configuration for the requested high-availability web application:

```hcl
# VPC Setup
resource "aws_vpc" "web_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "WebAppVPC" 
  }
}

resource "aws_subnet" "web_subnet_1" {
  vpc_id     = aws_vpc.web_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "WebSubnet1"
  }
}

resource "aws_subnet" "web_subnet_2" {
  vpc_id     = aws_vpc.web_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "WebSubnet2" 
  }
}

# Internet Gateway
resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    Name = "WebIGW"
  }
}

# Route table
resource "aws_route_table" "web_public_rt" {
  vpc_id = aws_vpc.web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_igw.id
  }

  tags = {
    Name = "WebPublicRouteTable"
  }
}

# Route table associations
resource "aws_route_table_association" "web_subnet_1_association" {
  subnet_id      = aws_subnet.web_subnet_1.id
  route_table_id = aws_route_table.web_public_rt.id
}

resource "aws_route_table_association" "web_subnet_2_association" {
  subnet_id      = aws_subnet.web_subnet_2.id 
  route_table_id = aws_route_table.web_public_rt.id
}

# Security Groups
resource "aws_security_group" "web_sg" {
  name        = "WebSG"
  description = "Allow HTTP/HTTPS traffic"
  vpc_id      = aws_vpc.web_vpc.id

  ingress {
    description      = "Allow HTTP traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow HTTPS traffic"
    from_port        = 443  
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSG"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "DBSG"
  description = "Allow PostgreSQL traffic"
  vpc_id      = aws_vpc.web_vpc.id
  
  ingress {
    description     = "Allow PostgreSQL traffic from web servers"
    from_port       = 5432
    to_port         = 5432 
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id] 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DBSG" 
  }
}

# S3 Bucket
resource "aws_s3_bucket" "web_bucket" {
  bucket = "my-web-bucket"
  acl    = "public-read"

  tags = {
    Name = "WebBucket"
  }  
}

# RDS PostgreSQL Database
resource "aws_db_instance" "web_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.7"  
  instance_class       = "db.t3.micro"
  db_name                 = "my_web_db"
  username             = "webadmin"  
  password             = "your_db_password"
  parameter_group_name = "default.postgres13"
  multi_az             = true  
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.web_db_subnet.name

  tags = {
    Name = "WebDB"
  }
} 

resource "aws_db_subnet_group" "web_db_subnet" {
  name       = "web-db-subnet-group"
  subnet_ids = [aws_subnet.web_subnet_1.id, aws_subnet.web_subnet_2.id]

  tags = {
    Name = "DB subnet group"
  }
}

# Application Load Balancer
resource "aws_lb" "web_lb" {
  name               = "WebLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.web_subnet_1.id, aws_subnet.web_subnet_2.id]
}

resource "aws_lb_target_group" "web_tg" {
  name     = "WebTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.web_vpc.id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# Auto Scaling Group
resource "aws_launch_configuration" "web_lc" {
  image_id        = "ami-0c55b159cbfafe1f0" 
  instance_type   = "t3.small"
  security_groups = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo your very first web server > /var/www/html/index.html'            
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_lc.name
  min_size = 2
  max_size = 2
  target_group_arns = [aws_lb_target_group.web_tg.arn]
  vpc_zone_identifier = [aws_subnet.web_subnet_1.id, aws_subnet.web_subnet_2.id]
}

resource "aws_autoscaling_attachment" "web_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_asg.id
  alb_target_group_arn   = aws_lb_target_group.web_tg.arn
}
```

This sets up a VPC with public subnets, security groups, an internet gateway and route table. It creates an S3 bucket, RDS PostgreSQL database, Application Load Balancer, Auto Scaling group of EC2 instances, and related resources to deploy a high availability web application.

Some things that could be added - health checks, SSL certificate, DNS, etc. But this covers the core infrastructure outlined in the requirements.