Here is modular Terraform code for the services you described:

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name        = "web-sg"
  description = "Security group for web servers"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  egress_rules = ["all-all"]
}

resource "aws_lb" "example" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.security_group.security_group_id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_target_group" "example" {
  name     = "webapp-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_autoscaling_group" "example" {
  availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  launch_template {
    id      = aws_launch_template.webapp.id
    version = "$Latest"
  }
} 

resource "aws_launch_template" "webapp" {
  image_id = "ami-0c55b159cbfafe1f0" 
  instance_type = "t3.small"
}

resource "aws_rds_cluster" "example" {
  engine         = "aurora-postgresql"
  engine_version = "13.7"

  database_name   = "mydb"
  master_username = "foo"
  
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]
}

resource "aws_s3_bucket" "assets" {
  bucket = "my-assets-bucket"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}
```

This creates a VPC, security groups, load balancer, auto scaling group, RDS cluster, and S3 bucket. It links together the resources, like attaching the security groups and subnets to other resources. The modules help simplify the VPC and security group setup. Additional resources can be added as needed.