# High-Availability Web Application on AWS using Terraform

This Terraform configuration sets up a highly available web application infrastructure on AWS, consisting of two EC2 instances (t3.small), an RDS PostgreSQL database (db.t3.micro), an S3 bucket for static assets, an Elastic Load Balancer, and Auto Scaling. The infrastructure is deployed within a custom VPC with appropriate security groups. All resources are tagged with the cost center 1234.

## Prerequisites

- AWS Account
- Terraform installed (version x.x.x)
- AWS CLI installed and configured with your AWS credentials

## Getting Started

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Run `terraform init` to initialize the Terraform working directory.
4. Review and customize the `variables.tf` file as needed.
5. Run `terraform plan` to preview the changes Terraform will make to your infrastructure.
6. Run `terraform apply` to create the infrastructure described in the Terraform configuration.

## Project Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vpc/
│   ├── security_groups/
│   ├── ec2/
│   ├── rds/
│   ├── s3/
│   ├── load_balancer/
│   └── auto_scaling/
├── README.md
└── ...
```

## Modules

### VPC
This module sets up a custom VPC with public and private subnets, NAT gateways, and internet gateways for high availability and security.

### Security Groups
This module defines the security groups for the EC2 instances, RDS database, and load balancer.

### EC2
This module creates two EC2 instances (t3.small) in the private subnets, which will host the web application.

### RDS
This module creates an RDS PostgreSQL database instance (db.t3.micro) in the private subnet for data storage.

### S3
This module creates an S3 bucket for storing static assets (e.g., images, CSS, JavaScript files) for the web application.

### Load Balancer
This module sets up an Elastic Load Balancer to distribute traffic across the two EC2 instances for high availability.

### Auto Scaling
This module configures Auto Scaling groups and policies for the EC2 instances to automatically scale resources based on demand.

## Security Improvements

- Use AWS Secrets Manager or AWS Systems Manager Parameter Store to store and manage sensitive data (e.g., database credentials, API keys).
- Enable AWS Config and AWS Config Rules to monitor and remediate configuration changes.
- Enable AWS CloudTrail for auditing and logging API activity.
- Consider implementing AWS Web Application Firewall (WAF) for additional web application security.
- Use AWS Key Management Service (KMS) to encrypt data at rest and in transit.

## Cost Optimization Tips

- Use AWS Cost Explorer and AWS Budgets to monitor and manage costs.
- Consider using AWS Auto Scaling and AWS Lambda for serverless computing to optimize resource utilization and reduce costs.
- Review and adjust instance types and RDS instance sizes based on actual usage and performance requirements.
- Implement AWS CloudWatch and AWS CloudWatch Logs for monitoring, alerting, and optimization.
- Use AWS Cost Optimization recommendations and AWS Trusted Advisor for cost-saving opportunities.

## Cost Breakdown

### EC2 (t3.small)
- Hourly Rate: $0.0208
- Daily Cost: $0.0208 x 24 hours x 2 instances = $0.9984
- Monthly Cost: $0.9984 x 30 days = $29.952

### RDS PostgreSQL (db.t3.micro)
- Hourly Rate: $0.017
- Daily Cost: $0.017 x 24 hours = $0.408
- Monthly Cost: $0.408 x 30 days = $12.24

### S3 (Standard Storage)
- Hourly Rate: $0.023 per GB
- Daily Cost: Depends on usage and data stored
- Monthly Cost: Depends on usage and data stored

### Elastic Load Balancer
- Hourly Rate: $0.0225 (plus data transfer costs)
- Daily Cost: $0.0225 x 24 hours = $0.54
- Monthly Cost: $0.54 x 30 days = $16.2

### VPC, NAT Gateways, and Data Transfer
- Hourly Rate: Varies based on usage and data transfer
- Daily Cost: Depends on usage and data transfer
- Monthly Cost: Depends on usage and data transfer

**Note:** The costs provided here are estimates based on the specified instance types and services. Actual costs may vary depending on usage, data transfer, and other factors. It's recommended to monitor and optimize costs regularly using AWS Cost Explorer and AWS Budgets.