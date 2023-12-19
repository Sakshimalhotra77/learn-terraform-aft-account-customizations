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

The web application code needs to be deployed separately onto the EC2 instances (e.g. using CodeDeploy). Static assets need to be uploaded to the S3 bucket manually (or using a pipeline).

The RDS database endpoint and credentials are outputted at the end of `terraform apply` and can be used to connect the application.

## Configuration

The EC2 instances are deployed across two availability zones for high availability. The Auto Scaling group scales based on CPU utilization.

Security groups restrict access appropriately between the different components.

## Cost Estimation

This infrastructure should cost approximately $X per month based on the selected instance types and features. The main costs are the EC2 instances, Load Balancer and RDS database.