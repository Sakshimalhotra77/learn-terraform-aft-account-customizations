Here is the Terraform code for the requested modules and resources:

```hcl
module "aws-macie" {
  source = "my-org/macie/aws"

  name                     = var.name
  finding_publishing_frequency = var.finding_publishing_frequency
  tags                     = var.tags
}

module "aws-guardduty" {
  source = "my-org/guardduty/aws"

  enable                     = var.enable 
  finding_publishing_frequency = var.finding_publishing_frequency
  tags                     = var.tags
}

module "aws-kms" {
  source = "my-org/kms/aws"

  description               = var.description
  policy                    = var.policy
  tags                      = var.tags
}

resource "aws_resource_name" "example" {
  # Configuration here for additional resource
}
```

The module blocks define the module name, source, and input parameters. The module source follows the `<org-name>/<module-name>/aws` convention to allow reuse across organizations. The parameters pass in the necessary config values.

For any additional resources not covered by a module, I created an example resource block that can be expanded with the resource configuration. This allows a modular setup where common services are modules and one-off resources are defined individually.