# Terraform Configuration for High-Availability Web Application

This Terraform configuration deploys a highly available web application infrastructure on AWS. It includes the following components:

- Two EC2 instances (t3.small) running the web application
- An RDS PostgreSQL database (db.t3.micro) for data storage
- An S3 bucket for storing static assets
- An Elastic Load Balancer for distributing traffic across the EC2 instances
- Auto Scaling group for automatically scaling the EC2 instances based on demand
- A custom VPC with appropriate security groups

## Prerequisites

Before deploying this configuration, ensure that you have the following:

- Terraform installed on your local machine
- AWS CLI configured with appropriate credentials
- An AWS account with necessary permissions to create the required resources

## Usage

1. Clone this repository or copy the Terraform configuration files to your local machine.
2. Navigate to the directory containing the Terraform configuration files.
3. Initialize the Terraform working directory by running `terraform init`.
4. Review the configuration and make any necessary changes (e.g., adjusting instance types, RDS settings, etc.).
5. Apply the configuration by running `terraform apply`. This will prompt you to confirm the changes before creating the resources.
6. Once the deployment is complete, Terraform will output the relevant information, such as the web application URL and the S3 bucket name.

## Configuration Files

- `main.tf`: This file defines the main infrastructure components, including the VPC, security groups, EC2 instances, RDS database, S3 bucket, and Load Balancer.
- `variables.tf`: This file contains the input variables used in the Terraform configuration, allowing you to customize various aspects of the deployment.
- `outputs.tf`: This file defines the output values that will be displayed after the deployment is complete, such as the web application URL and the S3 bucket name.

## Inputs

The following input variables are defined in `variables.tf`:

- `aws_region`: The AWS region where the resources will be deployed.
- `vpc_cidr_block`: The IP address range for the VPC.
- `public_subnet_cidr_blocks`: A list of IP address ranges for the public subnets.
- `private_subnet_cidr_blocks`: A list of IP address ranges for the private subnets.
- `instance_type`: The EC2 instance type for the web application instances.
- `db_instance_type`: The RDS instance type for the database.
- `db_name`: The name of the RDS database.
- `db_username`: The username for the RDS database.
- `db_password`: The password for the RDS database.

## Outputs

The following output values are defined in `outputs.tf`:

- `web_app_url`: The URL of the web application, accessible through the Load Balancer.
- `s3_bucket_name`: The name of the S3 bucket used for storing static assets.

## Cleanup

To remove all the resources created by this Terraform configuration, run `terraform destroy`. This will prompt you to confirm the destruction of resources before proceeding.

## License

This Terraform configuration is released under the [MIT License](LICENSE).