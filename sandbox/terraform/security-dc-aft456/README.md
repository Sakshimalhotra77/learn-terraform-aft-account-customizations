Here is a draft README for a Terraform configuration with EC2, RDS, and SSM resources:

# Terraform Infrastructure

This Terraform configuration provisions resources in AWS, including:

- EC2 Instances
- RDS Database Instance
- SSM Parameter Store Parameters

## Usage

1. Ensure you have the AWS CLI installed and configured with credentials to deploy into your AWS account

2. Install Terraform 

3. Navigate to the terraform directory 

4. Run `terraform init` to initialize the working directory 

5. Run `terraform plan` to preview the changes Terraform will make

6. Run `terraform apply` to deploy and provision the infrastructure

The core resources that will be created are:

- EC2 Instance(s) - The module supports creating single or autoscaled groups of Linux or Windows EC2 instances based on parameters
- RDS Postgres Database Instance - A Postgres database instance will be created and configured
- SSM Parameters - Key/value parameters will be stored in SSM Parameter Store 

Additionally, resources like VPC, subnets, security groups, IAM roles, etc. will be created to support the core resources.

The Terraform state file that tracks the resource metadata will be stored remotely in S3.

## Cleanup

To destroy all resources created and return back to an empty state:

`terraform destroy`

Let me know if you would like any additional details added to this README!