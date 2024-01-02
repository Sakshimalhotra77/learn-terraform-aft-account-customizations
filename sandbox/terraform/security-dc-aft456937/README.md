Here is a draft README for a Terraform configuration with EC2, RDS, and SSM resources:

# Terraform AWS Infrastructure

This Terraform configuration sets up basic AWS infrastructure including:

- EC2 instances
- RDS database instance
- SSM parameter store parameters

## Usage

1. Ensure you have the AWS CLI installed and configured with credentials to deploy to your AWS account

2. Initialize Terraform:

```
terraform init
```

3. Review and update `terraform.tfvars` with your AWS details

4. View changes to be made: 

```
terraform plan
```

5. Apply changes:

```
terraform apply
```

6. When finished with infrastructure, destroy resources: 

```
terraform destroy
```

## Resources Created

- EC2 instance(s) 
  - AMI, instance type, etc configurable in `variables.tf`
  - Security group allowing SSH ingress
  - IAM role with SSM access attached

- RDS PostgreSQL database instance
  - DB instance class, storage, etc configurable in `variables.tf`
  - Security group allowing ingress from EC2 security group

- SSM Parameters
  - `/my_app/db/username` - RDS database username
  - `/my_app/db/password` - RDS database password

Let me know if you would like any additional details included or have additional components to add!