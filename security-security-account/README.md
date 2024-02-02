Here is a draft README for a Terraform configuration with AWS KMS and Amazon GuardDuty:

# Terraform AWS Configuration

This Terraform configuration sets up AWS KMS and Amazon GuardDuty resources.

## Resources

The following resources are created:

- AWS KMS key - An AWS Key Management Service (KMS) customer master key (CMK) for encryption and decryption
- Amazon GuardDuty - Enables Amazon GuardDuty service for intelligent threat detection

## Usage

To use this module:

1. Set up AWS credentials in your environment 
2. Run `terraform init` to initialize the configuration
3. Run `terraform plan` to preview the changes
4. Run `terraform apply` to create the resources

## Requirements

- Terraform 0.12+
- AWS provider 2.0+
- Valid AWS account and credentials

## Inputs

No input variables are required.

## Outputs

No outputs are defined.

Let me know if you would like any changes or additions to this README! I tried to cover the key points but can add more detail if needed.