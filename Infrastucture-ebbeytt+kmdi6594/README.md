# AWS Web Application Infrastructure with Terraform

This Terraform configuration provisions a highly available web application infrastructure on AWS, consisting of the following components:

- Virtual Private Cloud (VPC) with public and private subnets
- Internet Gateway and NAT Gateway for internet access
- Security Groups for controlling inbound and outbound traffic
- Elastic Load Balancer (ELB) for distributing traffic across EC2 instances
- Auto Scaling Group (ASG) for automatically scaling EC2 instances based on demand
- Amazon Relational Database Service (RDS) for hosting a PostgreSQL database
- Amazon Simple Storage Service (S3) bucket for storing static assets

## Architecture Diagram

![Architecture Diagram](architecture-diagram.png)

## Prerequisites

- AWS Account
- Terraform installed (version >= 0.14)
- AWS CLI configured with appropriate credentials

## Usage

1. Clone the repository:

```
git clone https://github.com/example/aws-web-app.git
cd aws-web-app
```

2. Initialize Terraform:

```
terraform init
```

3. Review the execution plan:

```
terraform plan
```

4. Apply the Terraform configuration:

```
terraform apply
```

5. Once the infrastructure is provisioned, you can access the web application using the DNS name of the Elastic Load Balancer.

## Inputs

The following input variables are required:

- `aws_region`: AWS region to deploy the infrastructure (e.g., "us-east-1")
- `app_name`: Name of the web application (used for naming resources)
- `app_environment`: Environment for the web application (e.g., "dev", "prod")
- `instance_type`: EC2 instance type (default: "t3.small")
- `db_instance_type`: RDS instance type (default: "db.t3.micro")
- `db_password`: Password for the RDS database

## Outputs

The following outputs are provided:

- `elb_dns_name`: DNS name of the Elastic Load Balancer
- `s3_bucket_name`: Name of the S3 bucket for static assets
- `rds_endpoint`: Endpoint for the RDS database

## Security Improvements

- Enable AWS CloudTrail for auditing and logging
- Enable AWS Config for monitoring and compliance
- Implement AWS Web Application Firewall (WAF) for filtering malicious traffic
- Use AWS Secrets Manager or AWS Systems Manager Parameter Store for securely storing and retrieving sensitive data (e.g., database passwords)
- Implement AWS GuardDuty for threat detection and prevention
- Enable AWS Shield for DDoS protection
- Implement AWS Security Hub for centralized security and compliance monitoring

## Cost Optimization Tips

- Use AWS Budgets and Cost Explorer to monitor and manage costs
- Consider Reserved Instances or Savings Plans for EC2 and RDS instances
- Enable Auto Scaling based on demand to optimize resource usage
- Implement AWS S3 Lifecycle Policies for cost-effective storage management
- Use AWS Cost Anomaly Detection to identify and investigate cost anomalies
- Leverage AWS Trusted Advisor to identify cost optimization opportunities

## Cost Breakdown

### EC2 Instances (t3.small)

- On-Demand Pricing (Linux): $0.0208 per hour
- Total Daily Cost: $0.9984 (2 instances x 24 hours x $0.0208)
- Total Monthly Cost: $29.95 (assuming 30 days)

### RDS PostgreSQL (db.t3.micro)

- On-Demand Pricing: $0.017 per hour
- Total Daily Cost: $0.408
- Total Monthly Cost: $12.24 (assuming 30 days)

### Elastic Load Balancer

- Hourly Rate: $0.0225 per hour (plus data transfer costs)
- Total Daily Cost: $0.54
- Total Monthly Cost: $16.20 (assuming 30 days)

### Auto Scaling

- No additional cost (charges are based on EC2 instances)

### S3 Bucket

- Storage Cost: $0.023 per GB per month
- Data Transfer Cost: $0.09 per GB (first 1 TB / month)

### VPC, NAT Gateway, and Internet Gateway

- VPC: No additional cost
- NAT Gateway: $0.045 per hour
- Internet Gateway: $0.028 per hour
- Total Daily Cost: $1.75
- Total Monthly Cost: $52.50 (assuming 30 days)

### Total Estimated Monthly Cost

- EC2 Instances: $29.95
- RDS PostgreSQL: $12.24
- Elastic Load Balancer: $16.20
- VPC, NAT Gateway, and Internet Gateway: $52.50
- Total: Approximately $110.89 (excluding S3 and data transfer costs)

Please note that the actual costs may vary based on usage patterns, data transfer, and other factors. It's recommended to monitor your AWS costs regularly and adjust your infrastructure accordingly.