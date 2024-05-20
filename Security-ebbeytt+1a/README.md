Here is a draft README for a Terraform configuration to set up Amazon GuardDuty based on the requested service:

# Terraform Configuration for Amazon GuardDuty

## Overview

This Terraform configuration sets up Amazon GuardDuty to enable intelligent threat detection in your AWS environment. 

It will create the following resources:

- Enable GuardDuty in the specified region
- Create a new GuardDuty detector 
- Configure GuardDuty to monitor all accounts in the AWS organization

## Usage

To use this module, include something like the following in your Terraform configuration:

```
module "guardduty" {
  source = "git::https://github.com/mymodules/guardduty.git"
  
  aws_region = "us-east-1"
}
```

Then run `terraform init` to pull down the module and `terraform apply` to deploy the resources.

## Requirements

- An AWS account
- AWS credentials configured on the Terraform provider
- Terraform 0.12+

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_region | The AWS region to deploy GuardDuty into | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| guardduty_detector_id | The ID of the created GuardDuty detector |


This provides a starting point for setting up GuardDuty via Terraform based on the request for that service. Feel free to customize and extend as needed!