Here is a draft README for a Terraform configuration with KMS and WAF resources based on the user request:

# Terraform AWS Configuration

This Terraform configuration sets up AWS KMS and WAF resources.

## Features

- AWS Key Management Service (KMS)
  - Creates a KMS key for encryption/decryption
- AWS Web Application Firewall (WAF)
  - Creates a regional WAF web ACL 
  - Adds managed rule groups for SQL injection and cross-site scripting protection
  - Whitelists example IP addresses
  - Associates the WAF ACL with an Application Load Balancer

## Usage

1. Ensure Terraform is installed
2. Configure AWS credentials in the provider block
3. Run `terraform init` to initialize the working directory
4. Run `terraform plan` to preview the changes
5. Run `terraform apply` to deploy resources to AWS

## Resources

The following resources are configured:

- aws_kms_key
- aws_wafv2_web_acl
- aws_wafv2_managed_rule_group
- aws_wafv2_ip_set
- aws_wafv2_web_acl_association

## Inputs

No input variables are currently used.

Let me know if you would like me to modify or add anything to this draft README! I'm happy to update it based on any additional needs or details.