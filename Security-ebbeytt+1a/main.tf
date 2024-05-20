Here is a Terraform module for Amazon GuardDuty:

```hcl
module "guardduty" {
  source = "terraform-aws-modules/guardduty/aws"
  version = "~> 3.0"

  enable = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

This enables GuardDuty and configures it to publish findings every 15 minutes. Some key parameters:

- `enable` - Enable/disable GuardDuty
- `finding_publishing_frequency` - Frequency of publishing findings to S3

The module handles all the resources needed for GuardDuty like the detector resource, IAM roles, etc.

Additional services not covered could be configured as native Terraform resources like:

```hcl
resource "aws_service" "example" {
  # resource configuration  
}
```

The modules from the Terraform registry handle a lot of the complexity and best practices around services, so they are preferred when available. But any other services can be defined as standard resources.