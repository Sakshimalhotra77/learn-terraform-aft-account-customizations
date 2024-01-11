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

The outputs will display the Amazon Inspector assessment run ARN and secret ARN that can be referenced.

## Resources

- aws_kms_key: Encryption key used by Secrets Manager
- aws_secretsmanager_secret: Store sensitive data 
- aws_iam_role: Inspector service role 
- aws_iam_role_policy: Inspector permissions
- aws_inspector_assessment_template: Assessment template
- aws_inspector_assessment_target: Assessment target
- aws_inspector_assessment_run: Assessment run

The resources are configured to allow Amazon Inspector assessments to check for potential vulnerabilities. The results can be viewed in the Inspector console.

Sensitive data is securely stored in Secrets Manager using the KMS key for encryption.

Let me know if you would like any changes to this README!