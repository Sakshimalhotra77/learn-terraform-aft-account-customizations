Here is modular Terraform code for EC2, AWS KMS, and AWS Secrets Manager services:

```hcl
module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "my-ec2-instance"

  # EC2 module configuration  
}

module "kms" {
  source = "aws-ia/kms/aws"
  
  # KMS module configuration
}

resource "aws_secretsmanager_secret" "example" {
  # Secrets Manager resource configuration
}
```

The EC2 and KMS modules are sourced from the given module registries. Since I could not find a module source for Secrets Manager, I created a resource configuration for it directly. 

The modules allow the infrastructure to be broken down into reusable components. Additional module configuration would be added within each module block based on the input variables required. The Secrets Manager resource can be expanded to manage secrets.

This structure allows the services to be managed independently in a modular way, following best practices for Terraform code organization. Additional resources and modules can be added as needed.