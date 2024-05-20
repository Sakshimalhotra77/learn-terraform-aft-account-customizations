Sure, here's the Terraform code for Amazon GuardDuty:

```hcl
# Configure AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create GuardDuty Detector
resource "aws_guardduty_detector" "main" {
  enable = var.enable_guardduty
  finding_publishing_frequency = var.finding_publishing_frequency
  status_bucket = var.status_bucket
  status_prefix = var.status_prefix
  status_enabled = var.status_enabled
  status_source_addr = var.status_source_addr

  datasources {
    s3_logs {
      enable = var.s3_logs_enabled
    }
  }
}

# Define variables
variable "aws_region" {
  description = "AWS Region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "enable_guardduty" {
  description = "Enable or disable Amazon GuardDuty"
  type        = bool
  default     = true
}

variable "finding_publishing_frequency" {
  description = "The frequency of notifications sent about the findings"
  type        = string
  default     = "SIX_HOURS"
}

variable "status_bucket" {
  description = "The S3 bucket to store GuardDuty findings"
  type        = string
}

variable "status_prefix" {
  description = "The prefix for the GuardDuty findings in the S3 bucket"
  type        = string
  default     = "guardduty"
}

variable "status_enabled" {
  description = "Enable or disable monitoring of AWS Environment"
  type        = bool
  default     = true
}

variable "status_source_addr" {
  description = "IP address to monitor for AWS Environment"
  type        = string
  default     = ""
}

variable "s3_logs_enabled" {
  description = "Enable or disable S3 logs monitoring"
  type        = bool
  default     = true
}
```

This Terraform code configures the Amazon GuardDuty service in AWS. It creates a GuardDuty detector with the specified configurations, such as enabling or disabling GuardDuty, setting the notification frequency, and configuring the S3 bucket for storing findings.

You can customize the variables according to your requirements, such as changing the default values or adding additional variables for other GuardDuty configurations.

To use this code, save it as a `.tf` file (e.g., `guardduty.tf`) and run `terraform init` to initialize the Terraform working directory. Then, you can execute `terraform apply` to create or update the GuardDuty resources in your AWS account.