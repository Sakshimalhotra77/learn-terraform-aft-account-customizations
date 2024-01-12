Here is a draft README for the Terraform configuration based on the requested resources of EC2, AWS KMS, and AWS Secrets Manager:

# Terraform AWS Infrastructure

This Terraform configuration sets up key AWS infrastructure components:

## Components

### EC2
- Launches EC2 instances to host the application
- Allows specifying instance type, AMI, security groups, etc

### AWS KMS
- Creates a KMS key for encryption/decryption of data
- Enables and manages usage of encryption across services

### AWS Secrets Manager
- Stores secrets securely including database credentials
- Enables rotation of secrets to enhance security
- Integrates with other AWS services like RDS

## Usage

To use this Terraform config:

1. Ensure Terraform is installed 
2. Update `terraform.tfvars` with your AWS credentials and configuration parameters  
3. Run `terraform init` to initialize the working directory
4. Run `terraform plan` to preview the changes
5. Run `terraform apply` to provision the AWS resources

The EC2 instances, KMS keys and secrets in Secrets Manager will now be created and ready to use. The outputs will display useful attributes like DNS names and ARNs that can be referenced in application configuration.

Let me know if you would like me to modify or add anything to this draft README!