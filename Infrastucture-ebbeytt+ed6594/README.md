Here is a draft README for the Terraform configuration based on the requested components:

# Terraform Web Application Infrastructure

This Terraform configuration deploys a high-availability web application infrastructure.

## Components

- 2 x EC2 instances (t3.small)
- RDS PostgreSQL database (db.t3.micro)
- S3 bucket for static assets
- Elastic Load Balancer to distribute traffic across EC2 instances
- Auto Scaling group to scale EC2 instances based on demand
- VPC configured with appropriate security groups for each component

## Architecture

The 2 EC2 instances sit behind an Elastic Load Balancer which distributes traffic between them. The instances run in an Auto Scaling group which will automatically scale up and down based on demand.

The EC2 instances connect to an RDS PostgreSQL database for persistent storage. Static assets are served from an S3 bucket.

The infrastructure runs within a custom VPC with security groups restricting access between components appropriately. For example, the EC2 instances can connect to the database but external traffic cannot access the database directly.

## Usage

To deploy:

```
terraform init
terraform plan
terraform apply
```

This will deploy the fully high-availability architecture. The web application should be deployed to the EC2 instances to serve traffic from the Load Balancer. Assets can be uploaded to the S3 bucket.

To tear down the infrastructure:

```
terraform destroy
```

Let me know if you would like any additional details included in the README!