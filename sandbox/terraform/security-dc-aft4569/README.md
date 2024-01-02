Here is a draft README for a Terraform configuration with EC2, RDS, and SSM resources:

# Terraform Infrastructure

This Terraform configuration provisions resources in AWS, including:

- EC2 Instances
- RDS Database Instance
- SSM Parameter Store Parameters

## Usage

1. Ensure you have the AWS CLI installed and configured with credentials to deploy into your AWS account

2. Initialize Terraform

    ```bash
    terraform init
    ```

3. Review and update `terraform.tfvars` with your AWS details

4. View changes to be made

    ```bash 
    terraform plan
    ```

5. Apply changes

    ```bash
    terraform apply
    ```

6. When finished with infrastructure, destroy resources

    ```bash 
    terraform destroy
    ```

## Resources

- `ec2.tf` - EC2 Instances
- `rds.tf` - RDS MySQL Database Instance 
- `ssm.tf` - SSM Parameters

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_region | AWS region | string | - | yes |
| ec2_instance_type | EC2 instance type | string | `t3.micro` | no |
| db_engine | RDS database engine | string | `mysql` | no |  
| db_port | RDS database port | number | `3306` | no |

## Outputs

| Name | Description |
|------|-------------|
| ec2_public_ip | Public IP of EC2 instance |
| rds_endpoint | RDS instance endpoint |

Let me know if you would like me to modify or add anything to this draft README!