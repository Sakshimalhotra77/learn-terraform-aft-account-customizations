Here is a draft README for a Terraform configuration with SSM, EC2, RDS, and GuardDuty resources:

# Terraform AWS Infrastructure

This Terraform configuration sets up basic AWS infrastructure including EC2 instances, RDS database, Systems Manager access, and GuardDuty.

## Resources

- EC2
  - VPC with public and private subnets across two availability zones
  - Bastion host instance for secure access to private instances  
  - Application server launched in an autoscaling group across subnets
- RDS 
  - Postgres database instance in private subnet with security group access
- Systems Manager
  - EC2 instances associated with SSM for access and maintenance
- GuardDuty
  - GuardDuty enabled to monitor for suspicious activity  

## Usage

1. Ensure AWS CLI is configured on your local machine 
2. Update Terraform configuration with your AWS details 
3. Initialize Terraform 
    ```
    terraform init
    ```
4. Review and apply execution plan
    ``` 
    terraform plan
    terraform apply
    ```
5. Access and test infrastructure through AWS Console
   - EC2 instances + RDS database
   - SSM Sessions Manager  
   - GuardDuty findings

The README gives a high-level overview of the infrastructure components and how to use the Terraform configuration. Additional details can be added as needed. Let me know if you would like me to modify or add anything!