Here's the modular Terraform code to deploy the high-availability web application with the specified services and modules:

```hcl
# Define the VPC and subnets
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
}

resource "aws_subnet" "private" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${count.index + 2}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
}

# Define security groups
resource "aws_security_group" "web" {
  name_prefix = "web-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "elb" {
  name_prefix = "elb-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds" {
  name_prefix = "rds-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }
}

# Deploy EC2 instances
module "ec2" {
  source        = "your-org-name/ec2/aws"
  instance_type = "t3.small"
  count         = 2

  vpc_id                  = aws_vpc.main.id
  subnet_ids              = aws_subnet.public.*.id
  security_group_ids      = [aws_security_group.web.id]
  associate_public_ip     = true
  user_data               = file("user-data.sh")
}

# Deploy RDS PostgreSQL database
module "rds" {
  source         = "your-org-name/rds/aws"
  instance_class = "db.t3.micro"
  engine         = "postgres"
  multi_az       = true

  vpc_id              = aws_vpc.main.id
  subnet_ids          = aws_subnet.private.*.id
  security_group_ids  = [aws_security_group.rds.id]
}

# Deploy S3 bucket for static assets
module "s3" {
  source = "your-org-name/s3/aws"
}

# Deploy Elastic Load Balancer
module "elb" {
  source = "your-org-name/elb/aws"

  vpc_id                 = aws_vpc.main.id
  subnet_ids             = aws_subnet.public.*.id
  security_group_ids     = [aws_security_group.elb.id]
  instances              = module.ec2.instance_ids
  health_check_target    = "HTTP:80/"
}

# Deploy Auto Scaling
module "autoscaling" {
  source = "your-org-name/autoscaling/aws"

  vpc_id                  = aws_vpc.main.id
  subnet_ids              = aws_subnet.public.*.id
  security_group_ids      = [aws_security_group.web.id]
  target_group_arns       = module.elb.target_group_arns
  desired_capacity        = 2
  min_size                = 2
  max_size                = 4
  instance_type           = "t3.small"
  user_data               = file("user-data.sh")
}
```

In this code:

1. We define the VPC, public and private subnets, and security groups for the web servers, load balancer, and RDS database.
2. We use the `your-org-name/ec2/aws` module to deploy two EC2 instances with the `t3.small` instance type.
3. We use the `your-org-name/rds/aws` module to deploy an RDS PostgreSQL database with the `db.t3.micro` instance class and multi-AZ deployment.
4. We use the `your-org-name/s3/aws` module to create an S3 bucket for static assets.
5. We use the `your-org-name/elb/aws` module to create an Elastic Load Balancer and attach it to the EC2 instances.
6. We use the `your-org-name/autoscaling/aws` module to set up Auto Scaling for the EC2 instances, with a desired capacity of 2, minimum of 2, and maximum of 4 instances.

Note: You'll need to replace `your-org-name` with your actual organization name or the source path for the modules. Also, make sure to create the `user-data.sh` file with any necessary user data for your EC2 instances.