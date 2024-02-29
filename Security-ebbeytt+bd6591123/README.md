Here is a draft README for the Terraform configuration based on the requested resources of EC2, AWS KMS, and AWS GuardDuty:

# Terraform AWS Infrastructure

This Terraform configuration sets up core AWS infrastructure components.

## Components

- EC2
    - Launches EC2 instances based on specified AMI, instance type, VPC settings etc.
    - Allows setting User Data for instance bootstrapping
- AWS KMS
    - Creates AWS KMS key for encryption/decryption of data
    - Controls access to KMS key using IAM policies
- AWS GuardDuty
    - Enables GuardDuty service to monitor for threats
    - Sends findings to designated S3 bucket or CloudWatch Logs

## Usage

1. Update `terraform.tfvars` with your AWS credentials and regions
2. Run `terraform init` to initialize the working directory 
3. Run `terraform plan` to verify the resources to be created
4. Run `terraform apply` to create the AWS resources
5. When finished with resources, run `terraform destroy` to remove

Additional components can be added by editing the Terraform files and re-running applies.

## Requirements

- Terraform 0.12+
- AWS provider 2.x+

Let me know if you would like any changes or additions to this initial README!