Here is a Terraform module for AWS KMS:

```hcl
module "kms" {
  source = "my-org/kms/aws"

  key_description = "KMS key for encryption"
  deletion_window_in_days = 7  
  enable_key_rotation = true

  tags = {
    Environment = "dev"
  }
}
```

This sources the KMS module from the Terraform registry under the organization "my-org". It passes in some parameters for configuring the KMS key:

- `key_description`: A description for the KMS key
- `deletion_window_in_days`: How long the key should be recoverable after deletion
- `enable_key_rotation`: Enable automatic annual rotation of the key
- `tags`: Tags to apply to the KMS key

The module will handle creating the KMS key resource, access policies, key rotation, etc. This allows the KMS configuration to be packaged and reused easily.

For any other services not included as a module, a native Terraform resource can be used instead:

```hcl
resource "aws_s3_bucket" "data" {
  bucket = "my-data-bucket"  
  acl    = "private"

  tags = {
    Name = "My data bucket"
  }
}
```

This creates an S3 bucket resource directly since a module source wasn't provided.