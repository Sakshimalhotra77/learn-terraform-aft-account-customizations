# AWS Web Application with High Availability

This Terraform configuration provisions a highly available web application on AWS, with the following components:

- 2 EC2 instances (t3.small) running the web application
- An RDS PostgreSQL database (db.t3.micro) for data storage
- An S3 bucket for hosting static assets
- An Elastic Load Balancer for distributing traffic across the EC2 instances
- Auto Scaling for automatically scaling the EC2 instances based on demand
- A Virtual Private Cloud (VPC) with appropriate security groups

## Prerequisites

Before using this Terraform configuration, ensure that you have the following:

- AWS account and access credentials
- Terraform installed on your local machine

## Usage

1. Clone this repository or copy the Terraform configuration files to your local machine.
2. Update the `provider.tf` file with your AWS access key and secret key.
3. Customize the `variables.tf` file with your desired settings, such as instance types, database parameters, and S3 bucket name.
4. Initialize the Terraform working directory: `terraform init`
5. Review the execution plan: `terraform plan`
6. Apply the Terraform configuration: `terraform apply`

Terraform will provision the necessary resources on AWS, including the EC2 instances, RDS database, S3 bucket, Elastic Load Balancer, Auto Scaling group, and VPC with security groups.

## Security Improvements

This Terraform configuration follows several security best practices, such as:

- Deploying resources within a Virtual Private Cloud (VPC) for network isolation
- Configuring security groups to restrict inbound and outbound traffic
- Enabling encryption at rest for the RDS database
- Restricting access to the S3 bucket to authorized users/roles

To further enhance security, consider implementing the following:

- Enable AWS CloudTrail for auditing and logging AWS API calls
- Enable AWS Config for monitoring and recording resource configurations
- Enable AWS GuardDuty for threat detection and monitoring
- Implement AWS Key Management Service (KMS) for encryption key management
- Implement AWS Web Application Firewall (WAF) for protecting the web application from common web exploits

## Cost Optimization Tips

To optimize costs for this deployment, consider the following tips based on the AWS Well-Architected Framework:

- Use AWS Cost Explorer to monitor and analyze your AWS costs
- Enable AWS Budgets to set custom budgets and receive alerts when you exceed them
- Implement Auto Scaling policies to scale down resources during periods of low demand
- Leverage AWS Reserved Instances or Savings Plans for long-term commitments
- Enable AWS Data Lifecycle Manager for automated management of data retention and lifecycle policies
- Consider using AWS Graviton2-based instances for improved price-performance ratio

## Cost Breakdown

Here's a detailed cost breakdown for the AWS services used in this deployment, based on the AWS Pricing Calculator (as of May 2023):

### EC2 Instances (t3.small)

- Operating System: Amazon Linux 2
- Instance Type: t3.small
- Hourly Rate: $0.0208 per hour
- Daily Cost: $0.0208 x 24 = $0.4992
- Monthly Cost: $0.4992 x 30 = $14.976

### RDS Database (db.t3.micro)

- Database Engine: PostgreSQL
- Instance Type: db.t3.micro
- Hourly Rate: $0.0196 per hour
- Daily Cost: $0.0196 x 24 = $0.4704
- Monthly Cost: $0.4704 x 30 = $14.112

### S3 Bucket

- Storage Class: Standard
- Storage Used: 1 GB
- Monthly Cost: $0.023 per GB

### Elastic Load Balancer

- Load Balancer Type: Application Load Balancer
- Hourly Rate: $0.0225 per hour
- Daily Cost: $0.0225 x 24 = $0.54
- Monthly Cost: $0.54 x 30 = $16.2

### Auto Scaling

- Auto Scaling is a free service, but you pay for the underlying EC2 instances and other resources it manages.

### VPC and Security Groups

- VPC and security groups are free services.

### Total Daily Cost

- EC2 Instances: $0.4992 x 2 = $0.9984
- RDS Database: $0.4704
- S3 Bucket: $0.023 / 30 = $0.0007667
- Elastic Load Balancer: $0.54
- Total Daily Cost: $0.9984 + $0.4704 + $0.0007667 + $0.54 = $2.0091667

### Total Monthly Cost

- EC2 Instances: $14.976 x 2 = $29.952
- RDS Database: $14.112
- S3 Bucket: $0.023
- Elastic Load Balancer: $16.2
- Total Monthly Cost: $29.952 + $14.112 + $0.023 + $16.2 = $60.287

Please note that these costs are estimates and may vary depending on your actual usage, data transfer, and other factors. It's recommended to monitor your AWS costs regularly and adjust your resources accordingly.