Here is a draft README for the Terraform configuration based on using Amazon Inspector, AWS KMS, and AWS Secrets Manager:

# Terraform Infrastructure

This Terraform configuration sets up resources for using Amazon Inspector, AWS KMS, and AWS Secrets Manager.

## Usage

The main.tf file contains the configuration to create the following resources:

- AWS KMS key
- AWS Secrets Manager secret
- IAM role and policy for Amazon Inspector
- Amazon Inspector assessment template
- Amazon Inspector assessment target
- Amazon Inspector assessment run

To use:

1. Configure AWS provider in provider.tf
2. Run `terraform init` to initialize the working directory 
3. Run `terraform plan` to preview the changes
4. Run `terraform apply` to create the resources

The KMS key is used to encrypt the secret stored in Secrets Manager. The IAM policy grants the required permissions to Amazon Inspector. The assessment template, target and run will execute an Inspector scan on the specified EC2 instances.

The outputs display the ARN of resources created.

## Resources

- aws_kms_key
- aws_secretsmanager_secret
- aws_iam_role 
- aws_iam_role_policy
- aws_inspector_assessment_template
- aws_inspector_assessment_target  
- aws_inspector_assessment_run

Let me know if you would like me to modify or add anything to this README!