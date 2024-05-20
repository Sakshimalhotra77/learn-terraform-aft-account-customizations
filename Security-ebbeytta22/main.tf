Here's the Terraform configuration for Amazon GuardDuty:

```hcl
# Configure Amazon GuardDuty
resource "aws_guardduty_detector" "guardduty_detector" {
  enable = true

  # Optional settings
  datasources {
    # Enable all available data sources
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

  # Optional: Customize findings publishing
  finding_publishing_frequency = "SIX_HOURS"
}

# Optional: Create GuardDuty member accounts
# Note: Replace account_ids with your desired account IDs
resource "aws_guardduty_member" "member_accounts" {
  count              = length(var.member_account_ids)
  account_id         = var.member_account_ids[count.index]
  detector_id        = aws_guardduty_detector.guardduty_detector.id
  email              = "example@example.com"
  invite             = true
  disable_email_notification = false
}
```

This configuration creates an Amazon GuardDuty detector and enables all available data sources for threat detection. You can customize the settings as needed, such as the finding publishing frequency.

Additionally, if you have multiple AWS accounts and want to add them as GuardDuty member accounts, you can use the `aws_guardduty_member` resource. Replace `var.member_account_ids` with a list of account IDs you want to invite as members.

Note: Make sure to replace `example@example.com` with a valid email address for receiving GuardDuty notifications.