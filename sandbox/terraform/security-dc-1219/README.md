Here is a draft README for the requested Terraform configuration:

# Terraform Web Application Infrastructure

This Terraform configuration deploys a high-availability web application infrastructure.

## Architecture

The infrastructure consists of:

- 2 x t3.small EC2 instances running the web application behind an Application Load Balancer
- An Auto Scaling group to scale the EC2 instances based on demand
- A db.t3.micro RDS PostgreSQL database instance 
- An S3 bucket to store static assets
- A VPC configured with appropriate security groups for each component

## Usage

To deploy:

```
terraform init
terraform plan
terraform apply
```

The Terraform state will be stored remotely in an S3 bucket.

The web application can be accessed via the DNS name of the Application Load Balancer once deployed.

## Configuration

The EC2 instances are defined in `ec2.tf`. Database and S3 resources are defined in `storage.tf`. The networking layer with VPC, subnets, route tables and security groups are configured in `network.tf`.

Auto Scaling policies and rules can be customized in `autoscaling.tf`.

## Security

- Encryption at rest enabled for the RDS database 
- Access restricted to the VPC and security groups
- IAM policies control access to the S3 bucket

## Cost Estimation

At minimum capacity this infrastructure should cost around $60/month with 2 t3.small EC2 instances, a t3.micro RDS instance and S3 storage.