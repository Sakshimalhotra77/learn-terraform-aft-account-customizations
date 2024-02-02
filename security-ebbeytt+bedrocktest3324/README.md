Here is a draft README for a Terraform configuration to set up Amazon Macie, Amazon GuardDuty, and AWS KMS:

# Terraform Security Services

This Terraform configuration sets up the following security services on AWS:

- Amazon Macie
- Amazon GuardDuty 
- AWS Key Management Service (KMS)

## Amazon Macie

[Amazon Macie](https://aws.amazon.com/macie/) is enabled to provide data security and data privacy services through machine learning and pattern matching. Macie will monitor S3 buckets for sensitive data and provide alerts and dashboards.

The following resources are created:

- IAM role and policy to allow Macie to access buckets
- Macie member account
- Macie S3 bucket association to the monitored buckets

## Amazon GuardDuty 

[Amazon GuardDuty](https://aws.amazon.com/guardduty/) is enabled for intelligent threat detection. GuardDuty analyzes AWS account activity such as CloudTrail events, VPC Flow Logs, and DNS logs. It identifies threats through machine learning and pattern matching.

The following resource is created:

- GuardDuty detector resource

Review and customize the GuardDuty findings published to S3 buckets or Lambda functions.

## AWS Key Management Service (KMS)

[AWS KMS](https://aws.amazon.com/kms/) is enabled to allow encryption key creation and control. The following resources manage encryption keys:

- KMS key
- Key aliases 
- IAM policies to allow services to use the KMS keys

The KMS keys can be referenced by other services such as S3, EBS, and RDS for encryption.

## Usage

To run this Terraform:

```
terraform init
terraform plan
terraform apply
```

Customize the configuration as needed for your environment and security requirements. Review AWS documentation for additional options.