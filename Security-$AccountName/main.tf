Unfortunately I do not have enough context to generate full Terraform configuration code for unspecified AWS services. However, here is an example template for how Terraform modules could be defined and used for AWS services:

```hcl
module "s3" {
  source = "./modules/s3"

  bucket_name = "my-s3-bucket"
  tags = {
    Environment = "dev"
  }
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = "t2.micro"
  ami_id        = "ami-01234567890abcd"
}

module "dynamodb" {
  source = "./modules/dynamodb"
  
  hash_key = "UserId"
  range_key = "UserName"
  read_capacity = 20
  write_capacity = 10  
}

resource "aws_kms_key" "mykey" {
  description = "My KMS key"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY
}
```

The module blocks allow reuse of configuration for common services like S3, EC2 and DynamoDB. For less common services, the resources can be defined directly in the root module. The modules would be defined in the `./modules` directory, with variables and resources specific to that service.

Let me know if you have any other specific services or details to add for the Terraform configuration.