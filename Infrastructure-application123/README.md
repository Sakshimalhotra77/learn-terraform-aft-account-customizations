# Terraform AWS High-Availability Web Application

This Terraform configuration deploys a highly available web application on AWS, utilizing various services including EC2 instances, an RDS PostgreSQL database, an S3 bucket for static assets, an Elastic Load Balancer, and Auto Scaling. The infrastructure is set up within a custom VPC with appropriate security groups.

## Architecture

![Architecture Diagram](architecture.png)

The architecture consists of the following components:

- **Virtual Private Cloud (VPC)**: A custom VPC is created to host the entire infrastructure, providing network isolation and security.
- **Public and Private Subnets**: The VPC is divided into public and private subnets across multiple Availability Zones for high availability.
- **Internet Gateway and NAT Gateway**: An Internet Gateway is attached to the VPC to allow internet access from the public subnets, while a NAT Gateway is used for outbound internet access from the private subnets.
- **Security Groups**: Security groups are configured to control inbound and outbound traffic for each component.
- **EC2 Instances**: Two EC2 instances (t3.small) are launched in the private subnets to host the web application.
- **RDS PostgreSQL Database**: A highly available, multi-AZ RDS PostgreSQL database (db.t3.micro) is provisioned to store application data.
- **S3 Bucket**: An S3 bucket is created to store static assets for the web application.
- **Elastic Load Balancer (ELB)**: An Elastic Load Balancer is placed in the public subnets to distribute incoming traffic across the EC2 instances.
- **Auto Scaling Group**: An Auto Scaling group is configured to automatically scale the EC2 instances based on demand.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine
- AWS account and access keys with appropriate permissions

## Usage

1. Clone the repository:

```
git clone https://github.com/your-repo/terraform-aws-web-app.git
cd terraform-aws-web-app
```

2. Configure your AWS credentials by setting the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables or using an AWS credentials file (`~/.aws/credentials`).

3. Initialize Terraform:

```
terraform init
```

4. Review the Terraform plan:

```
terraform plan
```

5. Apply the Terraform configuration:

```
terraform apply
```

After successful deployment, Terraform will output the necessary information to access the web application, such as the DNS name of the Elastic Load Balancer.

## Security Improvements

The following security improvements can be implemented:

- **SSL/TLS Termination**: Configure the Elastic Load Balancer to handle SSL/TLS termination and forward traffic to the EC2 instances over an encrypted connection.
- **Web Application Firewall (WAF)**: Implement AWS WAF to protect the web application from common web exploits and bots.
- **Security Groups Audit**: Regularly review and audit security group rules to ensure they are following the principle of least privilege.
- **Auto Scaling Group Health Checks**: Configure the Auto Scaling group to perform periodic health checks and replace unhealthy instances.
- **AWS Config**: Enable AWS Config to record and track changes to the infrastructure for auditing and compliance purposes.
- **AWS GuardDuty**: Enable AWS GuardDuty to provide intelligent threat detection and continuous monitoring for potential security risks.

## Cost Optimization Tips

To optimize costs while maintaining high availability and performance, consider the following tips:

- **Instance Right-Sizing**: Regularly review and adjust the instance types based on actual usage and performance requirements.
- **Reserved Instances**: Purchase Reserved Instances for resources with steady-state usage to save costs compared to On-Demand pricing.
- **S3 Lifecycle Policies**: Implement S3 Lifecycle policies to transition objects to lower-cost storage classes or expire them based on defined rules.
- **RDS Database Snapshots**: Schedule regular RDS database snapshots and delete older snapshots to reduce storage costs.
- **Auto Scaling Schedules**: Configure Auto Scaling schedules to scale down resources during off-peak hours or periods of low demand.
- **AWS Cost Explorer**: Utilize AWS Cost Explorer to monitor and analyze costs, identify cost-saving opportunities, and set budgets.

## Cost Breakdown

Here's a breakdown of the estimated costs for this deployment, based on the AWS services used and their respective pricing. The costs are calculated using the AWS pricing for the `us-east-1` region and are subject to change.

### EC2 Instances (t3.small)

- **Hourly Rate**: $0.0208 per hour
- **Daily Cost**: $0.0208 x 24 hours = $0.4992 (for 2 instances)
- **Monthly Cost**: $0.4992 x 30 days = $14.976 (for 2 instances)

### RDS PostgreSQL Database (db.t3.micro)

- **Hourly Rate**: $0.017 per hour
- **Daily Cost**: $0.017 x 24 hours = $0.408 (for multi-AZ deployment)
- **Monthly Cost**: $0.408 x 30 days = $12.24 (for multi-AZ deployment)

### S3 Bucket

- **Storage Cost**: $0.023 per GB per month (first 50 TB)
- **Data Transfer Out Cost**: $0.09 per GB (first 10 TB per month)
- **Request Cost**: $0.0005 per 1,000 requests

*Note: S3 costs will vary based on your actual usage and data transfer.*

### Elastic Load Balancer

- **Hourly Rate**: $0.0225 per hour (for Application Load Balancer)
- **Daily Cost**: $0.0225 x 24 hours = $0.54
- **Monthly Cost**: $0.54 x 30 days = $16.20

### VPC, Internet Gateway, and NAT Gateway

- **VPC**: No additional cost
- **Internet Gateway**: $0.028 per hour = $0.672 per day = $20.16 per month
- **NAT Gateway**: $0.045 per hour = $1.08 per day = $32.40 per month

### Total Estimated Monthly Cost

- **EC2 Instances**: $14.976
- **RDS PostgreSQL Database**: $12.24
- **S3 Bucket**: Varies based on usage
- **Elastic Load Balancer**: $16.20
- **VPC, Internet Gateway, and NAT Gateway**: $52.56

**Total Estimated Monthly Cost**: $95.976 + S3 usage costs

*Note: This cost estimate is for the us-east-1 region and does not include data transfer, snapshot storage, or other optional AWS service costs. Actual costs may vary based on your usage patterns and regions.*

Remember to regularly monitor and optimize your AWS costs using tools like AWS Cost Explorer and AWS Budgets to stay within your budget.