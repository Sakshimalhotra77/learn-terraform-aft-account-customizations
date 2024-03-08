# High-Availability Web Application on AWS with Terraform

This Terraform configuration sets up a highly available web application on AWS, utilizing several services such as EC2, RDS, S3, ELB, Auto Scaling, and VPC. The application consists of two EC2 instances (t3.small), a PostgreSQL RDS database (db.t3.micro), and an S3 bucket for static assets. An Elastic Load Balancer distributes traffic across the EC2 instances, and Auto Scaling ensures that the desired number of instances is maintained based on demand.

## Prerequisites

- AWS account
- Terraform installed
- AWS CLI configured with appropriate credentials

## Usage

1. Clone the repository:

```
git clone https://github.com/your-repo/terraform-aws-web-app.git
cd terraform-aws-web-app
```

2. Initialize Terraform:

```
terraform init
```

3. Review the Terraform plan:

```
terraform plan
```

4. Apply the Terraform configuration:

```
terraform apply
```

5. Once the deployment is complete, the output will provide the DNS name of the Elastic Load Balancer, which can be used to access the web application.

## Architecture

The architecture consists of the following components:

- **VPC**: A virtual private cloud (VPC) is created with public and private subnets across multiple availability zones for high availability.
- **Security Groups**: Security groups are configured to control inbound and outbound traffic for the EC2 instances, RDS database, and load balancer.
- **EC2 Instances**: Two EC2 instances (t3.small) are launched in the private subnets, hosting the web application.
- **Elastic Load Balancer**: An Application Load Balancer distributes incoming traffic across the EC2 instances in multiple availability zones.
- **Auto Scaling Group**: An Auto Scaling group ensures that the desired number of EC2 instances is maintained based on demand.
- **RDS PostgreSQL Database**: A PostgreSQL database (db.t3.micro) is provisioned in a private subnet for data storage.
- **S3 Bucket**: An S3 bucket is created for storing static assets (e.g., CSS, JavaScript, images) for the web application.

## Security Improvements

The following security improvements can be implemented:

- **SSL/TLS Encryption**: Enable SSL/TLS encryption for the Elastic Load Balancer to secure data in transit.
- **VPC Endpoints**: Create VPC endpoints for S3 and RDS to securely access these services without traversing the internet.
- **Web Application Firewall (WAF)**: Implement AWS WAF in front of the Elastic Load Balancer to protect against common web application threats.
- **Secrets Management**: Use AWS Secrets Manager or AWS Systems Manager Parameter Store to securely store and retrieve sensitive data (e.g., database credentials).
- **CloudTrail**: Enable AWS CloudTrail to log and monitor AWS API calls for auditing and security analysis.

## Cost Optimization Tips

To optimize costs, consider the following tips based on the AWS Well-Architected Framework:

- **EC2 Instance Types**: Review the EC2 instance types (t3.small) and adjust based on your application's requirements. Consider using reserved instances for long-term workloads to save costs.
- **RDS Database Instance Type**: Evaluate the RDS instance type (db.t3.micro) and adjust based on your performance and storage requirements.
- **S3 Storage Class**: Use the appropriate S3 storage class (e.g., Standard-Infrequent Access) for static assets based on access patterns.
- **Auto Scaling Policies**: Configure Auto Scaling policies to scale in during periods of low demand to reduce the number of running EC2 instances.
- **CloudWatch Monitoring**: Enable CloudWatch monitoring and set alarms to detect and respond to underutilized or overprovisioned resources.
- **Cost Allocation Tags**: Apply cost allocation tags to resources to track and analyze costs by project, environment, or other relevant dimensions.

## Cost Breakdown

Here's a breakdown of the estimated costs for the AWS services used in this configuration based on the AWS pricing calculator (as of May 2023). Please note that these costs may vary based on your usage patterns, region, and any applicable discounts or promotions.

### EC2 Instances (t3.small)

- Instance Type: t3.small
- Hourly Rate: $0.0208 per hour
- Daily Cost (2 instances): $0.9984 (2 x $0.0208 x 24 hours)
- Monthly Cost (2 instances): $29.92 (daily cost x 30 days)

### RDS PostgreSQL Database (db.t3.micro)

- Instance Type: db.t3.micro
- Hourly Rate: $0.017 per hour
- Daily Cost: $0.408 ($0.017 x 24 hours)
- Monthly Cost: $12.24 (daily cost x 30 days)

### S3 Bucket

- Standard Storage Class
- Estimated Storage: 1 GB
- Monthly Cost: $0.023 (1 GB x $0.023 per GB)

### Elastic Load Balancer

- Application Load Balancer
- Hourly Rate: $0.0225 per hour
- Daily Cost: $0.54 ($0.0225 x 24 hours)
- Monthly Cost: $16.20 (daily cost x 30 days)

### VPC and Other Services

- VPC, Security Groups, Auto Scaling, and other services have minimal or no additional charges.

**Total Estimated Monthly Cost**: $58.38

Please note that this cost breakdown is an estimate and may vary based on your actual usage patterns, region, and any applicable discounts or promotions.