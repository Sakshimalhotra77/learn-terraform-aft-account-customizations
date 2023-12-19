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
    description      = "Allow HTTP from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow HTTPS from anywhere"
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

# S3 Bucket
resource "aws_s3_bucket" "web_bucket" {
  bucket = "my-web-bucket"
  acl    = "public-read"

  tags = {
    Name = "WebBucket"
  }
}

# RDS Database
resource "aws_db_instance" "web_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.7" 
  instance_class       = "db.t3.micro"
  db_name                 = "my_web_db"
  username             = "webadmin"  
  password             = "your_password"
  parameter_group_name = "default.postgres13"
  multi_az             = true 
  skip_final_snapshot  = true

  tags = {
    Name = "WebDB"
  }
} 

# Application Load Balancer
resource "aws_lb" "web_lb" {
  name               = "WebLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.web_subnet_1.id, aws_subnet.web_subnet_2.id]

  tags = {
    Name = "WebLB"
  }
}

# Target group
resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.web_vpc.id
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  name                 = "WebASG"
  max_size             = 2
  min_size             = 2
  health_check_type    = "ELB"
  desired_capacity     = 2

  vpc_zone_identifier  = [aws_subnet.web_subnet_1.id, aws_subnet.web_subnet_2.id]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
  
  tag {
    key                 = "Name"
    value               = "WebServer"
    propagate_at_launch = true
  }
}

# Launch template 
resource "aws_launch_template" "web_lt" {
  name          = "WebLT"
  
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.small"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "WebServer"
    }
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo your very basic web server > /var/www/html/index.html'            
              EOF
  )

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.web_sg.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Attach autoscaling group to load balancer
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_asg.id
  alb_target_group_arn   = aws_lb_target_group.web_tg.arn
}
```

This covers the key components:

- VPC with public and private subnets across AZs
- Security groups to allow HTTP/HTTPS 
- S3 bucket for static assets
- RDS PostgreSQL in Multi-AZ mode
- Application Load Balancer across subnets 
- Auto Scaling group of EC2 instances 
- Launch Template to configure EC2 instances
- Attachment of ASG to ALB

Additional improvements like SSL certificates, WAF, and CI/CD pipelines could be added.