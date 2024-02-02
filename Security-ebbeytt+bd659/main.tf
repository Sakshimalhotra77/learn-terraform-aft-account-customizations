Here is modular Terraform code for EC2, KMS, and GuardDuty using the provided module sources:

```hcl
module "ec2_instance" {
  source = "your-org-name/ec2-instance/aws"

  # EC2 instance configuration
}

module "kms" {
  source = "your-org-name/kms/aws"

  # KMS configuration  
}

module "guardduty" {
  source = "your-org-name/guardduty/aws"
  
  # GuardDuty configuration
}

# Terraform resource for any other services
resource "aws_s3_bucket" "data" {
  # S3 bucket configuration  
}
```

The module blocks allow reuse of existing Terraform modules for EC2, KMS, and GuardDuty based on the provided module sources. For S3, which did not have a module source, I created a standard Terraform resource configuration. This follows the modular pattern for established services while also allowing flexibility for other resources. The module and resource blocks would contain the appropriate configuration for each service.