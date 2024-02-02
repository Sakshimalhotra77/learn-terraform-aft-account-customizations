Here is a draft README for the Terraform configuration based on the requested resources of EC2, AWS KMS, and AWS GuardDuty:

# Terraform AWS Infrastructure

This Terraform configuration sets up core AWS infrastructure components.

## Components

- EC2
    - Launches EC2 instances based on specified AMI, instance type, VPC settings etc.
    - Allows setting User Data for instance bootstrapping
- AWS KMS
    - Creates Customer Master Key (CMK) for encryption/decryption operations
    - Enables key policies and grants for IAM roles/users
- AWS GuardDuty
    - Enables GuardDuty service in region
    - Sets up event publishing to S3 bucket
    - Adds GuardDuty member accounts if provided

## Usage

1. Update `terraform.tfvars` with your AWS credentials and regions
2. Modify `main.tf` as needed to change instance types, AMIs etc  
3. Run `terraform init` to initialize workspace 
4. Run `terraform plan` to verify config
5. Run `terraform apply` to deploy resources

The EC2, KMS and GuardDuty resources should now be created in your AWS account. See `outputs.tf` for accessing resource ids/arns after apply.

## Cleanup

To destroy all resources created by this Terraform config, run `terraform destroy`.

Let me know if you would like any changes or additions to this draft README!