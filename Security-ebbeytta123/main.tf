Sure, here's a Terraform module for Amazon GuardDuty:

```hcl
# Configure Amazon GuardDuty
resource "aws_guardduty_detector" "this" {
  enable = true

  # Optional settings
  finding_publishing_frequency = "SIX_HOURS" # Frequency for publishing findings. Valid values: FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS
  datasources {
    # Enable or disable specific data sources for GuardDuty
    s3_logs {
      enable = true
    }
    kubernetes {
      audit_logs {
        enable = true
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          enable = true
        }
      }
    }
  }
}

# Create SNS topic for GuardDuty findings
resource "aws_sns_topic" "guardduty_findings" {
  name = "guardduty-findings"
}

# Subscribe to SNS topic
resource "aws_sns_topic_subscription" "guardduty_findings_subscription" {
  topic_arn = aws_sns_topic.guardduty_findings.arn
  protocol  = "email"
  endpoint  = "example@example.com" # Replace with your email address
}

# Configure GuardDuty to publish findings to SNS topic
resource "aws_guardduty_publishing_destination" "findings_destination" {
  detector_id     = aws_guardduty_detector.this.id
  destination_arn = aws_sns_topic.guardduty_findings.arn
  kms_key_arn     = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab" # Optional KMS key ARN for encryption
}
```

This Terraform code does the following:

1. Creates an Amazon GuardDuty detector and configures various data sources.
2. Creates an Amazon SNS topic for GuardDuty findings.
3. Subscribes an email address to the SNS topic (replace `example@example.com` with your email address).
4. Configures GuardDuty to publish findings to the SNS topic.

You can customize the `datasources` block and other settings according to your requirements. Additionally, you can add or modify resources as needed, such as creating CloudWatch Event Rules and Lambda functions to take automated actions based on GuardDuty findings.