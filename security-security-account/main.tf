Here is modular Terraform code for AWS KMS and Amazon GuardDuty services:

```hcl
module "kms" {
  source = "terraform-aws-modules/kms/aws"

  description             = "My KMS key"
  deletion_window_in_days = 7  
}

module "guardduty" {
  source = "terraform-aws-modules/guardduty/aws"

  enable = true
  members = [
    "111111111111",
    "222222222222"  
  ]
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}
```

The kms and guardduty resources are defined as modules sourced from the Terraform AWS Modules registry. For the S3 bucket resource, which doesn't have a pre-defined module, I created an AWS provider resource configuration directly. This follows the standard Terraform resource block syntax.

Let me know if you need any other services configured or have additional questions!