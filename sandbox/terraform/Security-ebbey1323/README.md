Here is a draft README for a Terraform configuration with EC2 and RDS resources:

# Terraform AWS Infrastructure

This Terraform configuration sets up basic AWS infrastructure including EC2 instances and an RDS database.

## Resources

The following resources are created:

- EC2 Instance
  - AMI: ami-0c55b159cbfafe1f0 (Ubuntu)
  - Instance type: t2.micro
  - VPC + subnets: default VPC and subnets
  - Security group allowing SSH ingress
- RDS PostgreSQL database
  - db.t2.micro
  - Multi-AZ deployment
  - Random admin credentials generated
  - Security group allowing access only from the EC2 instance 

## Usage

1. Ensure you have Terraform v0.12+ installed 
2. Configure your AWS credentials using one of the supported methods for Terraform AWS provider
3. Initialize Terraform: `terraform init`
4. Review changes to be made: `terraform plan`
5. Apply changes: `terraform apply`

The EC2 instance and RDS database will be created. The EC2 instance security group is configured to allow inbound SSH access so you can connect and test database connectivity.

Further customization such as adding data sources, more instances, and other AWS resources can be done by adding to the Terraform configuration files.