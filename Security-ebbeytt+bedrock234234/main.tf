Here is the modular Terraform code for the requested AWS services:

```hcl
module "aws-kms" {
  source = "your-org-name/kms/aws"

  description = var.kms_description
  policy      = var.kms_policy
  tags        = var.kms_tags  
}

module "aws-detective" {
  source = "your-org-name/detective/aws"

  name    = var.detective_name 
  graph_arn = var.detective_graph_arn
  tags    = var.detective_tags
}

module "aws-inspector" {
  source = "your-org-name/inspector/aws"

  name                   = var.inspector_name
  assessment_target_name = var.inspector_assessment_target_name
  resource_group_arn     = var.inspector_resource_group_arn
  event_subscription     = var.inspector_event_subscription
  tags                   = var.inspector_tags
}

module "aws-macie" {
  source = "your-org-name/macie/aws"
  
  name                          = var.macie_name
  finding_publishing_frequency = var.macie_finding_publishing_frequency
  tags                          = var.macie_tags
}

resource "aws_guardduty_detector" "guardduty" {
  enable                       = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"
  
  tags = {
    Name = "GuardDuty"
  }
}
```

I created a Terraform resource configuration for Amazon GuardDuty since no module information was provided. The other services use the modular definitions and parameters you specified. Let me know if you need any changes!