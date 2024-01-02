Here is a Terraform configuration for AWS SSM, EC2, RDS and GuardDuty with best practices:

```hcl
# AWS provider configuration
provider "aws" {
  region = "us-east-1"
}

# SSM resource for parameter store
resource "aws_ssm_parameter" "example" {
  name  = "/example/param"
  type  = "String"
  value = "example value"
}

# EC2 resource with VPC, security group, etc
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "Web Server"
  }
}

resource "aws_security_group" "web" {
  name = "Web Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

# RDS MySQL instance 
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7" 
  instance_class       = "db.t2.micro"
  db_name              = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  
  skip_final_snapshot  = true
}

# GuardDuty detector
resource "aws_guardduty_detector" "example" {}
```

To validate the configuration is valid:

```
terraform init
terraform plan
```

This will initialize the working directory and check for any errors. If the plan runs without errors, then the Terraform is valid and ready to apply.

Let me know if you have any other questions!