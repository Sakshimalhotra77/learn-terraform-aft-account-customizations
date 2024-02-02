Here is a draft README for a Terraform configuration to set up AWS security services based on the requested list:

# AWS Security Services Terraform Module

This Terraform module sets up key AWS security services:

- AWS Key Management Service (AWS KMS)
- Amazon Detective
- Amazon Inspector 
- Amazon Macie
- Amazon GuardDuty

## Usage

```hcl
module "security_services" {
  source = "github.com/mymodules/aws-security-services"

  aws_kms_key_alias = "my-key"
  
  amazon_detective_enable = true
  
  amazon_inspector_enable = true

  amazon_macie_enable = true

  amazon_guardduty_enable = true
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_kms\_key\_alias | The display name of the AWS KMS key | `string` | - | yes |
| amazon\_detective\_enable | Whether to enable Amazon Detective | `bool` | `false` | no |  
| amazon\_inspector\_enable | Whether to enable Amazon Inspector | `bool` | `false` | no |
| amazon\_macie\_enable | Whether to enable Amazon Macie | `bool` | `false` | no |
| amazon\_guardduty\_enable | Whether to enable Amazon GuardDuty | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| kms\_key\_id | The globally unique identifier for the AWS KMS key |
| detective\_administrator\_account\_id | Account ID set as administrator for Amazon Detective |  

## Resources Created

- AWS KMS key
- Amazon Detective member account (if enabled)
- Amazon Inspector resource group and IAM role (if enabled) 
- Amazon Macie S3 bucket, account and member account (if enabled)
- Amazon GuardDuty detector (if enabled)

This covers the key details to include in a README for this Terraform module based on the requested AWS security services. The usage, requirements, inputs, outputs and resources give an overview of how the module works.