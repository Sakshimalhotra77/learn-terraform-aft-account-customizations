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

The Terraform state will be stored remotely in an S3 bucket for consistency.

The web application code needs to be deployed separately onto the EC2 instances (e.g. using CodeDeploy). Static assets need to be uploaded to the S3 bucket manually (or using a pipeline).

The Terraform configuration sets up the core infrastructure and networking components to get the architecture ready for the application.

## Configuration

Key components like VPC CIDR ranges, DB instance class, and Auto Scaling thresholds can be configured through variables in the `terraform.tfvars` file.

## Security Groups

The security groups restrict access to only necessary ports for each component:

- LB Security Group: 80/443 open to Internet
- Web Security Group: 80/443 open to LB SG
- DB Security Group: 5432 open to Web SG

This limits the attack surface area for the infrastructure.

Let me know if you need any other details in the README! I tried to cover the overall architecture, usage, and key configuration details.