Here is a draft README for a Terraform configuration with EC2 and RDS resources:

# Terraform AWS Infrastructure

This Terraform configuration sets up basic AWS infrastructure including EC2 instances and an RDS database.

## Resources

The following resources are created:

- **EC2 Instance** - EC2 instance running Amazon Linux 2. The instance type, key pair, and security group can be configured.

- **RDS Database** - RDS PostgreSQL database instance. The DB instance type, storage, engine version, and credentials can be configured.

## Usage

1. Ensure your AWS credentials are configured in one of the supported methods for Terraform AWS provider. 

2. Update `terraform.tfvars` with your AWS details and resource configuration.

3. Run `terraform init` to initialize the working directory.

4. Run `terraform plan` to preview the changes.

5. Run `terraform apply` to create the AWS resources.

6. Run `terraform destroy` when finished to tear down the resources to avoid unnecessary charges.

The EC2 instance and RDS database can now be accessed and utilized. The outputs provide connection and access details.

## Outputs

- `ec2_public_ip` - Public IP address of the EC2 instance
- `rds_endpoint` - Connection endpoint for the RDS database

Further customization and functionality can be added as needed for your application infrastructure.