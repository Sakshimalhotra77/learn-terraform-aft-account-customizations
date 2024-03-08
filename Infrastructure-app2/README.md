# High-Availability Web Application on AWS using Terraform

This Terraform configuration sets up a highly available web application architecture on AWS, utilizing various services such as EC2, RDS, S3, ELB, Auto Scaling, and VPC. The architecture is designed to provide fault tolerance and scalability for your application.

## Architecture Overview

The architecture consists of the following components:

1. **Virtual Private Cloud (VPC)**: A custom VPC is created with public and private subnets spanning across multiple Availability Zones (AZs) for high availability.
2. **Internet Gateway**: Attached to the VPC to allow internet connectivity.
3. **NAT Gateway**: Deployed in the public subnet to enable internet access for resources in the private subnets.
4. **Security Groups**: Inbound and outbound traffic rules are defined using security groups for each component (e.g., web servers, load balancer, database).
5. **EC2 Instances**: Two EC2 instances (t3.small) are launched in the private subnets, serving as the web servers.
6. **Auto Scaling Group**: An Auto Scaling group is configured to automatically launch or terminate EC2 instances based on demand, ensuring high availability and scalability.
7. **Elastic Load Balancer (ELB)**: An Application Load Balancer is set up in the public subnets to distribute incoming traffic across the EC2 instances.
8. **RDS PostgreSQL Database**: A PostgreSQL database (db.t3.micro) is provisioned in a private subnet for data storage and persistence.
9. **S3 Bucket**: An S3 bucket is created to store static assets (e.g., images, CSS, JavaScript files) for the web application.

## Prerequisites

Before running the Terraform configuration, ensure you have the following:

- AWS account with appropriate permissions.
- Terraform installed on your local machine.
- AWS CLI configured with your AWS credentials.

## Usage

1. Clone this repository to your local machine.
2. Navigate to the directory containing the Terraform configuration files.
3. Initialize the Terraform working directory by running `terraform init`.
4. Review the `terraform.tfvars` file and modify any variables as needed (e.g., AWS region, instance types, database credentials).
5. Run `terraform plan` to see the changes that will be applied.
6. If the plan looks good, apply the changes by running `terraform apply`.
7. After the deployment is complete, Terraform will output the relevant information, such as the load balancer DNS name and the S3 bucket name.

## Security Improvements

To enhance the security of the infrastructure, consider implementing the following improvements:

1. **Secure Baseline**: Follow AWS security best practices and enable secure baseline services like AWS Config, AWS GuardDuty, and AWS CloudTrail to monitor and protect your resources.
2. **Network Security**: Restrict inbound and outbound traffic using security groups and Network Access Control Lists (NACLs). Implement a bastion host or AWS Systems Manager Session Manager for secure administrative access.
3. **Encryption**: Enable encryption at rest (EBS volumes, RDS, S3) and in-transit (ELB, VPC endpoint) for data protection.
4. **Identity and Access Management (IAM)**: Follow the principle of least privilege and create separate IAM roles and policies for different components and tasks.
5. **Logging and Monitoring**: Enable logging and monitoring for all services (e.g., CloudWatch, VPC Flow Logs, S3 access logging) to detect and respond to security events.

## Cost Optimization Tips

To optimize costs while following the AWS Well-Architected Framework, consider the following tips:

1. **Right-Sizing**: Regularly review and adjust the instance types based on your application's needs to avoid over-provisioning.
2. **Auto Scaling**: Utilize Auto Scaling to automatically scale resources up or down based on demand, ensuring you only pay for the resources you need.
3. **Reserved Instances**: If you have predictable usage patterns, consider purchasing Reserved Instances to benefit from discounted rates.
4. **S3 Storage Class**: Use the appropriate S3 storage class (e.g., Standard-IA, Glacier) for infrequently accessed data to reduce storage costs.
5. **RDS Instance Type**: Choose the appropriate RDS instance type based on your performance and cost requirements. Consider using serverless options like Aurora Serverless for cost optimization.
6. **Monitoring and Optimization**: Regularly monitor your AWS costs using AWS Cost Explorer and implement cost optimization strategies based on your usage patterns.

## Cost Breakdown

Here's an estimated cost breakdown for the AWS services used in this architecture, based on the current AWS pricing in the `us-east-1` region (as of May 2023):

### EC2 Instances (t3.small)

- Hourly rate: $0.0208 per instance
- Daily cost for 2 instances: $0.0208 x 2 x 24 = $0.9984
- Monthly cost for 2 instances: $0.9984 x 30 = $29.952

### RDS PostgreSQL Database (db.t3.micro)

- Hourly rate: $0.017 per instance
- Daily cost: $0.017 x 24 = $0.408
- Monthly cost: $0.408 x 30 = $12.24

### S3 Bucket (Standard Storage)

- Storage cost: $0.023 per GB/month
- Data transfer cost (assuming 1 GB/month): $0.09 per GB
- Estimated monthly cost: $0.023 (storage) + $0.09 (data transfer) = $0.113

### Elastic Load Balancer

- Hourly rate: $0.0225 per hour (Application Load Balancer)
- Daily cost: $0.0225 x 24 = $0.54
- Monthly cost: $0.54 x 30 = $16.2

### VPC, Internet Gateway, NAT Gateway

- VPC and Internet Gateway: No additional charge
- NAT Gateway:
  - Hourly rate: $0.045 per NAT Gateway hour
  - Daily cost: $0.045 x 24 = $1.08
  - Monthly cost: $1.08 x 30 = $32.4

**Total Estimated Monthly Cost**: $29.952 (EC2) + $12.24 (RDS) + $0.113 (S3) + $16.2 (ELB) + $32.4 (NAT Gateway) = **$90.905**

Please note that this is an estimated cost based on the specified instance types and configurations. Actual costs may vary depending on your usage patterns, data transfer, and other factors.