Here's a modular Terraform code that meets the given requirements:

```hcl
# Define the provider
provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source  = "your-org-name/vpc/aws"
  version = "~> 1.0.0"

  cidr_block = "10.0.0.0/16"
  name       = "app-vpc"

  # Enable VPC Flow Logs
  enable_flow_log = true
}

# RDS Module
module "rds" {
  source  = "your-org-name/rds/aws"
  version = "~> 1.0.0"

  instance_class = "db.t3.micro"
  engine         = "postgres"
  username       = "dbadmin"
  password       = "securepassword"

  # Use multi-AZ deployment for high availability
  multi_az = true

  # Enable encryption at rest
  storage_encrypted = true

  # Enable automatic backups
  backup_retention_period = 7

  # VPC and DB Subnet Group
  vpc_id                = module.vpc.vpc_id
  db_subnet_group_name  = module.vpc.database_subnet_group_name

  # IAM Database Authentication
  iam_database_authentication_enabled = true
}

# S3 Module
module "s3" {
  source  = "your-org-name/s3/aws"
  version = "~> 1.0.0"

  bucket = "app-static-assets"

  # Enable versioning
  versioning_enabled = true

  # Encryption at rest
  sse_algorithm = "AES256"

  # Lifecycle policy
  lifecycle_rules = [
    {
      enabled                                = true
      abort_incomplete_multipart_upload_days = 7
      noncurrent_version_expiration = {
        days = 90
      }
    }
  ]
}

# Auto Scaling Module
module "auto_scaling" {
  source  = "your-org-name/autoscaling/aws"
  version = "~> 1.0.0"

  image_id      = "ami-0c94855ba95c71c99" # Replace with your AMI ID
  instance_type = "t3.small"
  min_size      = 2
  max_size      = 4

  # Distribute instances across multiple AZs
  availability_zones = module.vpc.public_subnet_ids

  # Load Balancer
  load_balancer_arn = module.load_balancer.load_balancer_arn

  # Auto Scaling Policies
  scaling_policies = [
    {
      policy_type               = "StepScaling"
      metric_name               = "CPUUtilization"
      metric_namespace          = "AWS/EC2"
      statistic                 = "Average"
      target_value              = 60.0
      scale_in_adjustment       = -1
      scale_out_adjustment      = 1
      scale_in_cooldown         = 300
      scale_out_cooldown        = 300
      estimated_instance_warmup = 300
    }
  ]
}

# Load Balancer
module "load_balancer" {
  source  = "your-org-name/alb/aws"
  version = "~> 1.0.0"

  name               = "app-alb"
  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  security_groups = [module.web_sg.security_group_id]
  subnets         = module.vpc.public_subnet_ids

  target_groups = [
    {
      name             = "app-tg"
      backend_protocol = "HTTP"
      backend_port     = 80
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012" # Replace with your certificate ARN
      target_group_index = 0
    }
  ]
}

# EC2 Security Group
module "web_sg" {
  source  = "your-org-name/security-group/aws"
  version = "~> 1.0.0"

  name        = "web-sg"
  description = "Security group for web servers"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      description = "Allow HTTP from Load Balancer"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Replace with your load balancer security group
    },
    {
      description = "Allow SSH from trusted IPs"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["your_trusted_ip/32"] # Replace with your trusted IP
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
```

This Terraform code follows a modular structure, with each service defined as a separate module. It includes comments explaining the purpose of each module, as well as best practices and security considerations.

The `vpc` module creates a new VPC with public and private subnets, and enables VPC Flow Logs for monitoring and troubleshooting.

The `rds` module creates an RDS PostgreSQL database instance in a private subnet, with multi-AZ deployment for high availability, encryption at rest, automatic backups, and IAM database authentication.

The `s3` module creates an S3 bucket for static assets, with versioning enabled, encryption at rest, and a lifecycle policy to manage object lifetimes.

The `auto_scaling` module creates an Auto Scaling group with two EC2 instances (t3.small) distributed across multiple Availability Zones. It also defines a scaling policy based on CPU utilization.

The `load_balancer` module creates an Application Load Balancer (ALB) in the public subnets, with an HTTPS listener configured to use a provided SSL certificate. It also defines a target group for the EC2 instances.

The `web_sg` module creates a security group for the EC2 instances, allowing HTTP traffic from the load balancer and SSH access from trusted IPs.

Note that you'll need to replace the placeholders (e.g., `your-org-name`, `ami-0c94855ba95c71c99`, `arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012`, and `your_trusted_ip/32`) with your organization's specific values.