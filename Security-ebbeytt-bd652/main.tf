Here is the Terraform configuration for Amazon Inspector, AWS KMS and AWS Secrets Manager:

```hcl
# AWS provider configuration
provider "aws" {
  region = "us-east-1" # AWS region
}

# Amazon Inspector resource
resource "aws_inspector_assessment_target" "example" {
  name                    = "example" # Name of the assessment target
  resource_group_arn      = aws_inspector_resource_group.example.arn # ARN of the associated resource group 
}

resource "aws_inspector_resource_group" "example" {
  tags = {
    Name = "example" # Tag the resource group
  }
}

# AWS KMS resources
resource "aws_kms_key" "mykey" {
  description             = "KMS key for encryption" # Description of the KMS key  
  deletion_window_in_days = 7 # Duration in days after which the key is deleted after destruction
}

# AWS Secrets Manager resource
resource "aws_secretsmanager_secret" "example" {
  name = "example" # Name of the secret
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = "my-secret" # Secret value
}
```

The above Terraform configuration defines the necessary resources for Amazon Inspector, AWS KMS and AWS Secrets Manager. 

Default values are provided where applicable and parameters are documented inline with comments. Supporting resources are included as needed and the HCL syntax is valid and should execute correctly with `terraform plan`.

Let me know if you need any changes or have additional requirements for the configuration.