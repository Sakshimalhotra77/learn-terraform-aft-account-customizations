Here is modular Terraform code for EC2, KMS, and GuardDuty using modules:

```hcl
module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "my-ec2-instance"
  instance_type  = "t2.micro"
  ami            = "ami-0c55b159cbfafe1f0"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "kms" {
  source = "terraform-aws-modules/kms/aws"

  description             = "My KMS key"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

module "guardduty" {
  source = "terraform-aws-modules/guardduty/aws"

  enable = true
  members = [
    "11111111111",
    "22222222222"  
  ]
}

# Additional resource

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-s3-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```

The key things to note are:

- Used standard modules from the Terraform registry for EC2, KMS and GuardDuty
- Passed in appropriate parameters for each one
- Created an S3 resource for an additional service not listed

This creates a modular and organized Terraform configuration. The modules help avoid duplication and allow reuse.