# High-Availability Web Application Deployment with AWS and Terraform

This Terraform configuration automates the deployment of a highly available web application on AWS. The architecture includes two EC2 instances, an RDS PostgreSQL database, an S3 bucket for static assets, an Elastic Load Balancer, and Auto Scaling capabilities. A Virtual Private Cloud (VPC) with security groups is also set up for network isolation and access control.

## Architecture Overview

![Architecture Diagram](architecture.png)

## Prerequisites

- AWS Account
- Terraform installed
- AWS CLI configured with appropriate credentials

## Usage

1. Clone the repository or download the Terraform configuration files.
2. Modify the `variables.tf` file to customize the configuration as per your requirements (e.g., instance types, database settings, etc.).
3. Initialize the Terraform working directory:

```
terraform init
```

4. Review the execution plan:

```
terraform plan
```

5. Apply the Terraform configuration to create the resources:

```
terraform apply
```

6. After successful deployment, the output will provide the necessary information to access the application, such as the load balancer DNS name.

## Cleanup

To destroy and remove all resources created by this Terraform configuration, run:

```
terraform destroy
```

## Security Improvements

- **Encryption**: Enable encryption at rest and in-transit for sensitive data, including RDS database and S3 bucket.
- **IAM Roles and Policies**: Implement least-privilege access principles using IAM roles and policies for EC2 instances and other resources.
- **Security Groups**: Review and tighten security group rules periodically to allow only necessary traffic.
- **VPC Flow Logs**: Enable VPC Flow Logs to monitor and analyze network traffic for potential security threats.

## Cost Optimization Tips

- **Instance Scheduling**: Schedule EC2 instances to run only during specific time periods if the application does not require 24/7 availability.
- **Reserved Instances**: Consider purchasing Reserved Instances for long-term workloads to reduce EC2 costs.
- **Auto Scaling**: Configure Auto Scaling policies to scale down resources when demand decreases.
- **S3 Lifecycle Policies**: Implement lifecycle policies for S3 buckets to transition or expire objects based on age.
- **RDS Instance Sizing**: Choose the appropriate RDS instance type and storage size based on performance and cost requirements.

## Cost Breakdown

The following cost breakdown provides an estimate of the hourly, daily, and monthly costs for the AWS services used in this deployment. Please note that these costs are approximate and may vary based on your specific configuration and usage patterns.

### EC2 Instances (t3.small)

- Hourly rate: $0.0208 per instance
- Daily cost: $0.9984 (2 instances x $0.0208 x 24 hours)
- Monthly cost: $29.95 (2 instances x $0.0208 x 720 hours)

### RDS PostgreSQL (db.t3.micro)

- Hourly rate: $0.017 per instance
- Daily cost: $0.408 (1 instance x $0.017 x 24 hours)
- Monthly cost: $12.24 (1 instance x $0.017 x 720 hours)

### S3 Bucket (Standard Storage)

- Hourly rate: $0.023 per GB (assuming 10 GB of storage)
- Daily cost: $0.552 (10 GB x $0.023 x 24 hours)
- Monthly cost: $16.56 (10 GB x $0.023 x 720 hours)

### Elastic Load Balancer

- Hourly rate: $0.0225 per hour
- Daily cost: $0.54 ($0.0225 x 24 hours)
- Monthly cost: $16.20 ($0.0225 x 720 hours)

### Data Transfer (Outbound)

- Hourly rate: $0.09 per GB (assuming 10 GB of data transfer per month)
- Monthly cost: $0.90 (10 GB x $0.09)

### Total Estimated Monthly Cost

- EC2 Instances: $29.95
- RDS PostgreSQL: $12.24
- S3 Bucket: $16.56
- Elastic Load Balancer: $16.20
- Data Transfer: $0.90

**Total Estimated Monthly Cost: $75.85**

Please note that this cost breakdown is an estimate based on the specified configurations and assumptions. Actual costs may vary depending on your usage patterns, data transfer volumes, and any additional services or resources you might use.