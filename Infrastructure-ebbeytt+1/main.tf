Sure, here's a modular Terraform code that follows the specified requirements and best practices:

```hcl
# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source = "your-org-name/vpc/aws"

  cidr_block = "10.0.0.0/16"
  name       = "my-vpc"

  # Enable NAT gateways and private subnets for resources not needing internet access
  enable_nat_gateway = true

  # Manage access with security groups instead of ACLs
  manage_default_security_group = true

  # Enable VPC flow logs for visibility
  enable_flow_log = true

  # Cost center tag
  cost_center = "12312"
}

# S3 Bucket Module
module "s3_bucket" {
  source = "your-org-name/s3/aws"

  bucket = "my-static-assets"

  # Enable versioning to recover from accidental deletes or overwrites
  versioning_enabled = true

  # Use lifecycle policies to manage object lifetimes
  lifecycle_rule = [
    {
      enabled                                = true
      abort_incomplete_multipart_upload_days = 7
      noncurrent_version_expiration = {
        days = 90
      }
    }
  ]

  # Enable encryption if storing sensitive data
  encrypt_bucket = true

  # Apply least privilege access control
  bucket_acl = "private"

  # Cost center tag
  cost_center = "12312"
}

# RDS Module
module "rds" {
  source = "your-org-name/rds/aws"

  instance_class = "db.t3.micro"
  engine         = "postgres"
  username       = "myapp"
  password       = "supersecretpassword"

  # Use multi-AZ deployment for high availability
  multi_az = true

  # Encrypt database instances at rest
  storage_encrypted = true

  # Enable automatic backups
  backup_retention_period = 7

  # Use IAM database authentication for enhanced security
  iam_database_authentication_enabled = true

  # Regularly rotate credentials
  rotate_credentials = true

  # VPC and subnet dependencies
  vpc_id                = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnets[0]

  # Cost center tag
  cost_center = "12312"
}

# EC2 Module
module "ec2" {
  source = "your-org-name/ec2/aws"

  instance_type = "t3.small"
  ami           = "ami-0cff7528ff583bf9a" # Replace with your desired AMI
  count         = 2

  # Use the latest AMI for enhanced security
  use_latest_ami = true

  # Enable detailed monitoring for better performance insights
  monitoring = true

  # If 'instance_type' is 't2.micro', enable T2/T3 Unlimited
  enable_t2_unlimited = false

  # VPC and security group dependencies
  vpc_id                  = module.vpc.vpc_id
  associate_public_ip     = true
  associate_eip           = true
  security_group_ids      = [module.security_group.security_group_id]
  subnet_ids              = module.vpc.public_subnets
  user_data               = file("user_data.sh")

  # Cost center tag
  cost_center = "12312"
}

# Auto Scaling Group Module
module "auto_scaling" {
  source = "your-org-name/autoscaling/aws"

  min_size         = 2
  max_size         = 4
  desired_capacity = 2

  # Set up scaling policies based on metrics like CPU utilization
  scaling_policies = [
    {
      name                  = "scale-up"
      metric_name           = "CPUUtilization"
      scaling_adjustment    = 1
      adjustment_type       = "ChangeInCapacity"
      cooldown              = 300
      policy_type           = "SimpleScaling"
      estimated_instance_warmup = 300
    },
    {
      name                  = "scale-down"
      metric_name           = "CPUUtilization"
      scaling_adjustment    = -1
      adjustment_type       = "ChangeInCapacity"
      cooldown              = 300
      policy_type           = "SimpleScaling"
      estimated_instance_warmup = 300
    }
  ]

  # Distribute instances across multiple availability zones
  availability_zones = module.vpc.availability_zones

  # Launch configuration and load balancer dependencies
  launch_configuration_name = module.ec2.launch_configuration_name
  load_balancer_arn         = module.load_balancer.load_balancer_arn

  # Cost center tag
  cost_center = "12312"
}

# Load Balancer
resource "aws_lb" "web_loadbalancer" {
  name               = "web-loadbalancer"
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [module.security_group.security_group_id]

  # Cost center tag
  tags = {
    CostCenter = "12312"
  }
}

# Security Group
module "security_group" {
  source = "your-org-name/security-group/aws"

  name        = "web-server-sg"
  description = "Security group for web servers"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["your_office_ip/32"]
      description = "Allow SSH access from known IP"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]

  # Cost center tag
  cost_center = "12312"
}
```

This Terraform code includes the following:

1. **VPC Module**: Sets up a VPC with public and private subnets, NAT gateways, security group management, and flow logs. The VPC is tagged with the specified cost center.

2. **S3 Bucket Module**: Creates an S3 bucket for static assets with versioning enabled, lifecycle policies, and encryption (if needed). The bucket is set to private access, and it's tagged with the cost center.

3. **RDS Module**: Provisions an RDS PostgreSQL database instance with multi-AZ deployment, encryption at rest, automatic backups, IAM database authentication, and credential rotation. The database is deployed in the VPC's private subnets and tagged with the cost center.

4. **EC2 Module**: Launches two t3.small EC2 instances with the latest AMI, detailed monitoring, and T2/T3 Unlimited enabled (if necessary). The instances are placed in the VPC's public subnets, associated with public IPs and Elastic IPs, and tagged with the cost center.

5. **Auto Scaling Group Module**: Sets up an Auto Scaling group with a minimum of 2 instances, a maximum of 4 instances, and a desired capacity of 2 instances. Scaling policies are defined based on CPU utilization, and instances are distributed across multiple availability zones. The Auto Scaling group is associated with the launch configuration and load balancer, and it's tagged with the cost center.

6. **Load Balancer**: Creates an Application Load Balancer in the VPC's public subnets, associated with the web server security group, and tagged with the cost center.

7. **Security Group Module**: Defines a security group for the web servers, allowing HTTP traffic from anywhere and SSH access from a known IP. The security group is tagged with the cost center.

Additionally, the code follows best practices such as:

- Modular structure with separate modules for each service
- Conditional logic and best practices as per the provided guidelines
- Necessary dependencies between resources
- Comments explaining the purpose and configuration of each module or resource
- Cost center tag applied to all resources

Please note that you'll need to replace `your-org-name` with your organization's name or the appropriate source for each module. Also, make sure to update the AMI ID, user data script path, and any other placeholders with the correct values for your environment.