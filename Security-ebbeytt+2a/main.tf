Certainly! Here's the modular Terraform code for Amazon GuardDuty:

```
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Create GuardDuty Detector
resource "aws_guardduty_detector" "main" {
  enable = true
  finding_publishing_frequency = "SIX_HOURS" # Possible values: FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS

  # Optional - Enable data sources
  datasources {
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
        ebs_volumes = true
      }
    }
  }

  # Optional - Configure GuardDuty to send findings to CloudWatch Events
  event_bridge {
    event_bridge_enabled = true
  }

  # Optional - Configure SNS topic for notifications
  notification {
    # Create SNS Topic
    topic {
      name = "guardduty-notifications"
    }
  }
}
```

This Terraform code creates an Amazon GuardDuty detector in the specified AWS region. It enables the detector and sets the finding publishing frequency to six hours. You can modify the `finding_publishing_frequency` value to suit your needs.

The code also includes optional configurations for enabling data sources, sending findings to CloudWatch Events, and configuring an SNS topic for notifications.

Please note that you need to replace the `region` value in the `provider` block with your desired AWS region.

You can save this code in a `.tf` file (e.g., `main.tf`) and run `terraform init` followed by `terraform apply` to create the GuardDuty resources in your AWS account.