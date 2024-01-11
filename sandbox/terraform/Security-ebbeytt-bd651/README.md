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

The outputs will display the Amazon Inspector assessment run ARN and secret ARN that can be referenced in other resources.

## Resources

- aws_kms_key: Encryption key for secrets
- aws_secretsmanager_secret: Store sensitive data 
- aws_iam_role: IAM roles for Amazon Inspector
- aws_inspector_assessment_template: Inspector assessment template
- aws_inspector_assessment_target: Inspector assessment target 
- aws_inspector_assessment_run: Inspector assessment run

The Terraform configuration handles provisioning these resources and connecting the appropriate permissions and roles.

## Security

This follows security best practices by restricting IAM permissions and using AWS KMS for encryption. The secrets can store sensitive data securely.

## Cost

This infrastructure has relatively low costs, mostly coming from the Amazon Inspector scans and AWS Secrets Manager usage. AWS KMS usage should be very low cost.

Let me know if you would like any changes to this draft README!