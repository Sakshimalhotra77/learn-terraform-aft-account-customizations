Sure, here's the modular Terraform code for Amazon GuardDuty:

```hcl
# Configure the AWS provider
provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Create an Amazon GuardDuty Detector
resource "aws_guardduty_detector" "example" {
  enable = true # Set to false to disable GuardDuty

  # Optional settings
  datasources {
    s3_logs {
      enable = true
    }
  }

  # Additional optional settings can be added as needed
}

# Output the GuardDuty Detector ID
output "guardduty_detector_id" {
  value       = aws_guardduty_detector.example.id
  description = "The ID of the GuardDuty Detector"
}
```

This Terraform code will:

1. Configure the AWS provider with the specified region.
2. Create an Amazon GuardDuty Detector with the following:
   - Enable the detector by setting `enable = true`.
   - Enable S3 data source logs by setting `datasources.s3_logs.enable = true`. You can add additional data sources as needed.
3. Output the GuardDuty Detector ID for reference.

Note: This is a basic GuardDuty configuration. You can customize it further by adding additional settings or resources as per your requirements. For example, you can configure GuardDuty to send findings to an Amazon CloudWatch Event or enable AWS Config integration.

To use this code, save it in a `.tf` file (e.g., `guardduty.tf`) and run the following Terraform commands:

```
terraform init
terraform apply
```

Terraform will prompt you to confirm the changes before applying them.