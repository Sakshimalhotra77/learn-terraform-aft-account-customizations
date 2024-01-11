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

- aws_kms_key: Encryption key for secrets
- aws_secretsmanager_secret: Store sensitive data 
- aws_iam_role: IAM roles for Amazon Inspector
- aws_inspector_assessment_template: Inspector assessment template
- aws_inspector_assessment_target: Inspector assessment target
- aws_inspector_assessment_run: Inspector assessment run

The Terraform state and any secrets will be stored and encrypted by default using the AWS backend.

## Security

This configuration enables encryption, secrets protection, and vulnerability scanning to improve security.

- KMS key enables encryption of data
- Secrets Manager protects sensitive data
- Amazon Inspector scans for vulnerabilities

The IAM policies restrict access and authorization.

## Costs

This configuration incurs costs for:

- KMS key usage
- Secrets Manager storage 
- Amazon Inspector scans and assessments

Please refer to each AWS service pricing page for details.