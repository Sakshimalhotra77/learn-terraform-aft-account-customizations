Here is modular Terraform code for EC2, AWS KMS, and AWS Secrets Manager:

```hcl
module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "my-ec2-instance"
  instance_type  = "t2.micro"
  ami            = "ami-0c55b159cbfafe1f0"
}

module "kms" {
  source = "terraform-aws-modules/kms/aws"

  description = "My KMS key"
  policy      = data.aws_iam_policy_document.kms.json
}

data "aws_iam_policy_document" "kms" {
  # policy statements...
}

resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = "secret123"
}
```

The EC2 and KMS resources are defined as modules, while Secrets Manager uses native Terraform resource blocks since there is no predefined module for it. Additional services not listed could also be added using native Terraform resource blocks.