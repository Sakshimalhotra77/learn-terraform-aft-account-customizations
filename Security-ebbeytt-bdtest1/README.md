Here is a draft README for the Terraform configuration based on the requested resources of EC2, AWS KMS, and AWS Secrets Manager:

# Terraform AWS Infrastructure

This Terraform configuration sets up key AWS infrastructure components:

- EC2 instance
- AWS Key Management Service (KMS) 
- AWS Secrets Manager

## Usage

To provision this infrastructure:

1. Configure your AWS provider credentials in `providers.tf`
2. Run `terraform init` to initialize the working directory 
3. Run `terraform plan` to preview the changes
4. Run `terraform apply` to provision the resources

## Resources

The following resources are provisioned:

### EC2

- `aws_instance`: Provisions an EC2 instance to run your applications

### AWS KMS

- `aws_kms_key`: Creates a KMS key for encryption/decryption of data
- `aws_kms_alias`: Creates a friendly name alias to refer to the KMS key 

### AWS Secrets Manager

- `aws_secretsmanager_secret`: Stores a secret securely using KMS encryption
- `aws_secretsmanager_secret_version`: Populates the secret value 

## Inputs

The following input variables are configurable:

- `instance_type` - The EC2 instance type
- `instance_name` - The name assigned to the EC2 instance  
- `secret_name` - The name of the secret to create

## Outputs

The following outputs are exported:

- `instance_id` - The ID of the EC2 instance
- `instance_public_dns` - The public DNS name of the EC2 instance

The KMS key ID and ARN are available as well to reference the encryption keys.

## Requirements

- AWS provider credentials configured
- Terraform v0.11+

## License

This code is released under the MIT License. See LICENSE for details.