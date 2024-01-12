Here is a draft README for the Terraform configuration based on the requested resources of EC2, AWS KMS, and AWS Secrets Manager:

# Terraform AWS Infrastructure

This Terraform configuration sets up key AWS infrastructure components:

## Components

### EC2
- Launches EC2 instances to host the application
- Allows specifying instance type, AMI, security groups, etc

### AWS KMS
- Creates a KMS key for encryption/decryption of data
- Enables encryption of EC2 storage volumes

### AWS Secrets Manager
- Stores sensitive credentials and configuration securely
- Integrates with other AWS services like RDS databases

## Usage

1. Ensure Terraform is installed
2. Configure AWS credentials in provider block
3. Modify variables.tf to customize deployment
4. Run `terraform init` to initialize 
5. Run `terraform plan` to preview infrastructure changes
6. Run `terraform apply` to deploy AWS infrastructure

## Inputs

| Name | Description | Type | Default |  
|--|--|--|--|
| ec2_instance_type | EC2 instance type | string | t3.micro |
| kms_deletion_window | Duration KMS keys are recoverable after deletion (days) | number | 7 |
| secrets_name_prefix | Naming prefix for secrets created in Secrets Manager | string | production- |

## Outputs

| Name | Description |
|--|--|
| ec2_public_ip | Public IP address of EC2 instance |
| kms_key_id | Key ID of KMS key |
| secrets_arn | ARN of Secrets Manager secret |

Let me know if you would like me to modify or add anything to this draft README!