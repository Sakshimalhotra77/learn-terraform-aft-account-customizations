Sure, here's the modular Terraform code for the requested services:

```
# Amazon Inspector Module
module "aws_inspector" {
  source = "terraform-aws-modules/inspector/aws"

  # Module Parameters
  tags = {
    Environment = "Production"
    Service     = "Inspector"
  }
}

# Amazon GuardDuty Module
module "aws_guardduty" {
  source = "terraform-aws-modules/guardduty/aws"

  # Module Parameters
  allow_non_encrypted_storage          = false
  enable_anomaly_detection             = true
  enable_cloudtrail_event_logs         = true
  enable_kubernetes_event_logs         = true
  enable_s3_logs                       = true
  enable_unprocessed_cloudwatch_logs   = true
  publish_destination_arn              = "<SNS_TOPIC_ARN>"
  finding_publishing_frequency         = "FIFTEEN_MINUTES"
  tags = {
    Environment = "Production"
    Service     = "GuardDuty"
  }
}

# AWS Security Hub Resource
resource "aws_securityhub_account" "main" {
  depends_on = [module.aws_inspector, module.aws_guardduty]
}

resource "aws_securityhub_standards_subscription" "aws_standards" {
  depends_on = [aws_securityhub_account.main]
  standards_arn = "arn:aws:securityhub:::ruleset/aws-foundational-security-best-practices/v/1.0.0"
}

# Enable and configure Security Hub for specific regions
data "aws_region" "current" {}

resource "aws_securityhub_org_admin_account" "org_admin_account" {
  admin_account_id = "<ADMIN_ACCOUNT_ID>"
}

resource "aws_securityhub_org_admin_account" "org_enabled_regions" {
  for_each = [
    data.aws_region.current.name,
    "us-east-1",
    "us-west-1",
    "eu-west-1"
  ]

  admin_account_id     = aws_securityhub_org_admin_account.org_admin_account.admin_account_id
  member_account_id    = "<MEMBER_ACCOUNT_ID>"
  enable_organization  = true
  region               = each.value
}
```

This code includes:

1. The Amazon Inspector module from the `terraform-aws-modules/inspector/aws` source, with a tag for the Environment and Service.
2. The Amazon GuardDuty module from the `terraform-aws-modules/guardduty/aws` source, with various configurations like enabling anomaly detection, CloudTrail event logs, Kubernetes event logs, S3 logs, and unprocessed CloudWatch logs. It also sets the publishing destination ARN (for SNS topic) and publishing frequency, along with tags for the Environment and Service.
3. An `aws_securityhub_account` resource to enable AWS Security Hub.
4. An `aws_securityhub_standards_subscription` resource to subscribe to the AWS Foundational Security Best Practices standard.
5. Configuration for enabling and setting up Security Hub in specific regions (current region, us-east-1, us-west-1, eu-west-1) using the `aws_securityhub_org_admin_account` and `aws_securityhub_org_admin_account` resources. You'll need to replace `<ADMIN_ACCOUNT_ID>` and `<MEMBER_ACCOUNT_ID>` with your actual account IDs.

Please note that you may need to adjust the module parameters and other configurations based on your specific requirements.