Here is a Terraform module for Amazon GuardDuty:

```hcl
module "guardduty" {
  source = "your-org-name/guardduty/aws"

  enable = true
}

resource "aws_guardduty_detector" "default" {
  enable = module.guardduty.enable
}
```

This defines a GuardDuty module that enables GuardDuty and passes that configuration to the aws_guardduty_detector resource. The module source follows the organization/module/provider pattern you specified.

Some key things this provides:

- The module encapsulates the enable flag, allowing it to be changed in one place
- The aws_guardduty_detector resource references the enable flag from the module for consistency
- The module can be reused across different Terraform configs
- Additional GuardDuty options and resources could be added to the module for simplicity

Let me know if you need any other services configured as modules!