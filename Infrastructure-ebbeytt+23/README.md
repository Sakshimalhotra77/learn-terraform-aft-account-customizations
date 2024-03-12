# Highly Available Web Application on AWS

This Terraform configuration sets up a highly available web application on AWS using the following resources:

- 2 EC2 instances (t3.small) running the application
- 1 RDS PostgreSQL database (db.t3.micro)
- 1 S3 bucket for static assets
- Elastic Load Balancer (ELB)
- Auto Scaling group
- Virtual Private Cloud (VPC) with appropriate security groups

## Prerequisites

- Terraform installed on your local machine
- AWS account with appropriate permissions
- AWS credentials configured on your local machine

## Usage

1. Clone this repository or download the Terraform configuration files.
2. Navigate to the directory containing the Terraform configuration files.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform plan` to preview the changes that Terraform will make to your AWS infrastructure.
5. Run `terraform apply` to create or update the AWS resources defined in the configuration.

## Architecture

The web application is hosted on two EC2 instances (t3.small) for high availability. These instances are part of an Auto Scaling group, which automatically adjusts the number of instances based on the defined scaling policies. The instances are deployed across multiple Availability Zones within the specified AWS region for fault tolerance.

The application connects to a PostgreSQL database (db.t3.micro) hosted on Amazon RDS for data storage. RDS offers automated backups, patching, and failover capabilities, ensuring durability and reliability of the database.

Static assets, such as images, CSS, and JavaScript files, are stored in an S3 bucket for efficient content delivery.

The Elastic Load Balancer (ELB) distributes incoming traffic across the EC2 instances, ensuring high availability and fault tolerance. It automatically routes traffic to healthy instances and removes unhealthy instances from the load balancing pool.

The entire infrastructure is deployed within a Virtual Private Cloud (VPC) with appropriate security groups to control inbound and outbound traffic, providing an additional layer of security and isolation.

## Security Improvements

1. **Encryption**: Enable encryption at rest and in-transit for sensitive data, such as RDS database, S3 bucket, and ELB logs.
2. **Access Control**: Implement least-privilege access principles by using AWS Identity and Access Management (IAM) roles and restrictive security group rules.
3. **Logging and Monitoring**: Enable AWS CloudTrail for logging AWS API calls, and set up CloudWatch alarms for monitoring critical metrics and triggering automated actions.
4. **Network Security**: Implement network segregation using private and public subnets, and restrict access to sensitive resources (e.g., RDS) from the internet.
5. **Patching and Updates**: Set up automatic patching and updates for EC2 instances, RDS database, and other managed services to ensure the latest security patches are applied.

## Cost Optimization Tips (AWS Well-Architected Framework)

1. **Right-Size Resources**: Analyze resource utilization and adjust instance types or database configurations to match actual workload requirements.
2. **Reserved Instances or Savings Plans**: Consider purchasing Reserved Instances or Savings Plans for long-term commitments to reduce costs.
3. **Auto Scaling**: Leverage Auto Scaling to scale resources up or down based on actual demand, minimizing idle resources and associated costs.
4. **Lifecycle Management**: Implement lifecycle policies for S3 buckets and RDS backups to automatically delete or archive old data, reducing storage costs.
5. **Cost Monitoring**: Set up cost monitoring and budgeting tools (e.g., AWS Billing and Cost Management) to track and optimize costs.

## Cost Breakdown

Here's a detailed breakdown of the estimated costs for the AWS services used in this configuration, based on the US East (N. Virginia) region pricing as of May 2023. Please note that these costs are subject to change and may vary depending on your AWS region and usage patterns.

### EC2 Instances (t3.small)

- Hourly rate: $0.0208 per hour
- Daily cost for 2 instances: $0.0208 x 2 x 24 = $0.9984
- Monthly cost for 2 instances: $0.9984 x 30 = $29.952

### RDS PostgreSQL (db.t3.micro)

- Hourly rate: $0.017 per hour
- Daily cost: $0.017 x 24 = $0.408
- Monthly cost: $0.408 x 30 = $12.24

### S3 Bucket

- Storage cost: $0.023 per GB per month
- Data transfer cost (assuming 1 GB of data transfer): $0.09 per GB
- Total monthly cost (assuming 1 GB of storage and 1 GB of data transfer): $0.023 + $0.09 = $0.113

### Elastic Load Balancer (ELB)

- Hourly rate: $0.0225 per hour
- Daily cost: $0.0225 x 24 = $0.54
- Monthly cost: $0.54 x 30 = $16.2

### VPC and Security Groups

- No additional costs for VPC and security groups

### Total Estimated Monthly Cost

- EC2 instances: $29.952
- RDS PostgreSQL: $12.24
- S3 Bucket: $0.113
- Elastic Load Balancer: $16.2
- Total: $29.952 + $12.24 + $0.113 + $16.2 = $58.505

Please note that these cost estimates are based on the specified instance types and configurations. Actual costs may vary based on your usage patterns, data transfer, and other factors. It's recommended to regularly monitor and optimize your AWS resources to manage costs effectively.