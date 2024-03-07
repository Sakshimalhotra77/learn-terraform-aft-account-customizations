# High Availability Web Application Infrastructure

This Terraform configuration sets up a highly available web application infrastructure on AWS. It includes two EC2 instances, an RDS PostgreSQL database, an S3 bucket for static assets, an Elastic Load Balancer, Auto Scaling, and a VPC with security groups.

## Infrastructure Components

1. **VPC**: A Virtual Private Cloud (VPC) is created to isolate the infrastructure resources.
2. **Subnets**: Two public subnets and two private subnets are created within the VPC for high availability and network isolation.
3. **Internet Gateway**: An Internet Gateway is attached to the VPC to provide internet access.
4. **NAT Gateway**: A NAT Gateway is set up in one of the public subnets to enable outbound internet access for resources in the private subnets.
5. **EC2 Instances**: Two EC2 instances of type `t3.small` are launched in the private subnets to host the web application.
6. **Auto Scaling Group**: An Auto Scaling group is configured for the EC2 instances to automatically scale the number of instances based on demand.
7. **Elastic Load Balancer**: An Elastic Load Balancer is set up in the public subnets to distribute incoming traffic across the EC2 instances.
8. **RDS Database**: An RDS PostgreSQL database of type `db.t3.micro` is created in one of the private subnets to store application data.
9. **S3 Bucket**: An S3 bucket is created to store static assets for the web application.
10. **Security Groups**: Security groups are defined to control inbound and outbound traffic to and from the various components.

## Prerequisites

- AWS account and credentials
- Terraform installed

## Usage

1. Clone this repository.
2. Modify the `variables.tf` file to set your desired values for the infrastructure components.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform plan` to review the proposed changes.
5. Run `terraform apply` to create the infrastructure resources.
6. After the deployment is complete, Terraform will output the relevant information, such as the Elastic Load Balancer's DNS name and the RDS database endpoint.

## Clean Up

To remove the deployed infrastructure, run `terraform destroy`.

## Contributions

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or bug fixes.