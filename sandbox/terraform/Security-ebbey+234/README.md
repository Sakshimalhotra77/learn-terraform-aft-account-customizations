Here is a draft README for a Terraform configuration to deploy WAF and Shield based on the user request:

# Terraform AWS WAF and Shield

This Terraform configuration sets up AWS WAF and Shield protections.

## Features

- Deploys AWS WAF with basic rulesets to block common web attacks
- Enables AWS Shield Advanced for DDoS protection

## Usage

1. Update `terraform.tfvars` with your AWS credentials and desired region
2. Run `terraform init` to initialize the working directory 
3. Run `terraform plan` to preview the changes
4. Run `terraform apply` to deploy AWS WAF and Shield

## Resources

The following resources are created by this Terraform configuration:

- **AWS WAF Web ACL**: Creates a WAF Web ACL with basic SQL injection and XSS protection rulesets
- **AWS Shield**: Enables Shield Advanced protection for AWS resources

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_region | AWS region | string | - | yes |
| aws_access_key | AWS access key | string | - | yes | 
| aws_secret_key | AWS secret key | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| waf_web_acl_id | The ID of the AWS WAF Web ACL |
| shield_subscription_id | The AWS Shield subscription ID |

Let me know if you would like me to modify or add anything to this draft README!