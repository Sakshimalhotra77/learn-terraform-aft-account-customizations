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
2. Run `terraform init` to initialize the working directory 
3. Modify `terraform.tfvars` to specify your AWS credentials, region, etc
4. Run `terraform plan` to verify the resources to be created
5. Run `terraform apply` to deploy the infrastructure

The EC2 instances, KMS keys and Secrets Manager secrets will be created and configured. Resources can be modified by editing the Terraform config files.

## Additional Details

The infrastructure can be customized as needed by adding additional Terraform config files. Examples include:
- Launching an Auto Scaling Group 
- Adding RDS databases and integrating with Secrets Manager
- Expanding the KMS keys to encrypt S3 buckets
- Adding further IAM policies and roles

Let me know if you would like any clarification or have additional requirements to discuss!