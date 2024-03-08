Sure, here's a modular Terraform code that meets your requirements. I've included comments to explain each section and the best practices followed.

```hcl
# Define the required providers
provider "aws" {
  region = "us-east-1" # Specify the desired AWS region
}

# Use the VPC module from your organization
module "vpc" {
  source           = "your-org-name/vpc/aws"
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  # Best Practice: Design public and private subnets for multi-tier architecture
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Use the RDS module from your organization
module "rds" {
  source              = "your-org-name/rds/aws"
  instance_class      = "db.t3.micro"
  engine              = "postgres"
  username            = "dbadmin"
  password            = "super-secret-password" # Replace with a secure password

  # Best Practice: Encrypt database instances at rest and enable automatic backups
  storage_encrypted = true
  backup_retention_period = 7

  # Conditional Logic: Use multi-AZ deployment for production workloads
  multi_az = true

  # Security Note: Use IAM database authentication for enhanced security
  iam_database_authentication_enabled = true

  # Dependencies
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnets
  db_subnet_group_name = module.vpc.db_subnet_group_name
}

# Use the EC2 module from your organization
module "web" {
  source        = "your-org-name/ec2/aws"
  instance_type = "t3.small"
  ami           = "ami-0cff7528ff583bf9a" # Replace with the desired AMI ID
  count         = 2

  # Best Practice: Use the latest AMI for enhanced security
  # Best Practice: Enable detailed monitoring for better performance insights
  monitoring = true

  # Conditional Logic: If 'instance_type' is 't2.micro', enable T2/T3 Unlimited
  # (not applicable in this case as we're using t3.small)

  # Security Note: Ensure instances are placed in private subnets
  subnet_ids = module.vpc.private_subnets

  # Dependencies
  vpc_security_group_ids = [aws_security_group.web.id]
}

# Create a security group for the web instances
resource "aws_security_group" "web" {
  name_prefix = "web-"
  vpc_id      = module.vpc.vpc_id

  # Allow incoming HTTP traffic from the load balancer
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security group for the load balancer
resource "aws_security_group" "lb" {
  name_prefix = "lb-"
  vpc_id      = module.vpc.vpc_id

  # Allow incoming HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an Elastic Load Balancer
resource "aws_lb" "web" {
  name               = "web-lb"
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.lb.id]
}

# Create a target group for the load balancer
resource "aws_lb_target_group" "web" {
  name        = "web-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
  }
}

# Create an Auto Scaling group
resource "aws_autoscaling_group" "web" {
  name                = "web-asg"
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  target_group_arns   = [aws_lb_target_group.web.arn]
  vpc_zone_identifier = module.vpc.private_subnets

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  # Best Practice: Use lifecycle policies to manage instance lifetimes
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}

# Create a launch template for the Auto Scaling group
resource "aws_launch_template" "web" {
  name_prefix            = "web-"
  instance_type          = "t3.small"
  image_id               = "ami-0cff7528ff583bf9a" # Replace with the desired AMI ID
  vpc_security_group_ids = [aws_security_group.web.id]
}

# Use the S3 module from your organization
module "static_assets" {
  source = "your-org-name/s3/aws"
  bucket = "my-static-assets-bucket" # Replace with the desired bucket name

  # Conditional Logic: If storing sensitive data, enable encryption
  # (not necessary for static assets in this case)

  # Best Practice: Enable versioning to recover from accidental deletes or overwrites
  versioning_enabled = true

  # Best Practice: Use lifecycle policies to manage object lifetimes
  lifecycle_rule = {
    enabled = true
    expiration = {
      days = 90
    }
  }

  # Security Note: Apply least privilege access control
  # (not covered in this example)
}

# Output the load balancer DNS name
output "web_lb_dns_name" {
  value       = aws_lb.web.dns_name
  description = "The DNS name of the web load balancer"
}
```

This Terraform code follows best practices and includes comments explaining each section. It creates a high-availability web application using two EC2 instances, an RDS PostgreSQL database, and an S3 bucket for static assets. It also sets up an Elastic Load Balancer and Auto Scaling group, and configures the necessary VPC and security groups.

Please note that you'll need to replace the placeholders (`your-org-name`, AMI IDs, bucket name, etc.) with your organization's module names and the appropriate values for your environment.