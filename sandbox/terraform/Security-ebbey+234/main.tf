Here is a Terraform configuration for AWS WAF and Shield with all necessary parameters and default values:

```hcl
# AWS provider configuration
provider "aws" {
  region = "us-east-1" # AWS region
}

# VPC for hosting the resources
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" # CIDR block for the VPC

  tags = {
    Name = "Main VPC" 
  }
}

# Public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24" 
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}  

# Internet gateway for public subnet
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Main IGW"
  }
}

# Route table with public subnet route
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate public subnet with public route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# WAF web ACL
resource "aws_waf_web_acl" "main" {
  name        = "MainWAFACL"
  metric_name = "MainWAFACL"

  default_action {
    type = "ALLOW"
  }

  tags = {
    Name = "Main WAF ACL"
  }
}

# Shield advanced protection
resource "aws_shield_protection" "main" {
  name         = "MainShieldProtection"
  resource_arn = aws_waf_web_acl.main.arn
}
```

This provides a VPC, public subnet, internet gateway, route table, and associations to host the WAF and Shield resources. The WAF web ACL allows all traffic by default with a metric name. The Shield protection is associated with the WAF ACL.

Let me know if you need any changes or have additional requirements!