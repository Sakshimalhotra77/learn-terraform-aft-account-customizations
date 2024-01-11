Here is a draft README for the Terraform configuration based on using Amazon Inspector, AWS KMS, and AWS Secrets Manager:

# Terraform Infrastructure

This Terraform configuration sets up resources for using Amazon Inspector, AWS KMS, and AWS Secrets Manager.

## Usage

The main.tf file contains the configuration to create the following resources:

- AWS KMS key
- AWS Secrets Manager secret
- IAM roles and policies for Amazon Inspector
- Amazon Inspector assessment template
- Amazon Inspector assessment target
- Amazon Inspector assessment run

To use:

1. Configure AWS provider in provider.tf
2. Run `terraform init` to initialize the working directory 
3. Run `terraform plan` to preview the changes
4. Run `terraform apply` to create the resources

The outputs will display the Amazon Inspector assessment run ARN and secret ARN that can be referenced.

## Resources

- aws_kms_key: Encryption key used by Secrets Manager
- aws_secretsmanager_secret: Store sensitive data 
- aws_iam_role: IAM roles for Amazon Inspector
- aws_inspector_*: Amazon Inspector assessment template, target, and run

The Terraform state contains the metadata and attributes for these resources.

## Security

- KMS key enables encryption of the secret
- IAM roles grant least privilege permissions
- Secrets Manager securely stores credentials 

Rotate secrets and update Inspector as needed for security.

Let me know if you would like any additional details in the README!