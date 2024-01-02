Here is a draft README for the Terraform configuration to create and manage AWS SSM Parameter Store parameters:

# Terraform AWS SSM Parameter Store

This Terraform configuration sets up AWS SSM Parameter Store parameters to securely store application configuration and secrets.

## Usage

The Terraform configuration does the following:

- Creates a `/config` hierarchy in SSM Parameter Store for application configuration parameters
- Creates a `/secrets` hierarchy in SSM Parameter Store for secrets like database passwords
- Sets secure strings as the parameters' types
- Allows managing parameter values externally through Terraform (e.g. in a separate variables file)
- Enables versioning of parameters to track history and allow rollbacks
- Sets up IAM policies to control access to parameters

To use:

1. Update `variables.tf` with your own parameters and secrets
2. Run `terraform init` to initialize the configuration 
3. Run `terraform plan` to preview resource changes
4. Run `terraform apply` to create the SSM parameters
5. Access the parameters securely from your application

The parameters can be managed further via Terraform, e.g. updating values or adding new parameters.

This provides a secure and auditable way to manage your application configuration and secrets.

## Inputs

- `config_params` - Map of configuration parameters to create under `/config`
- `secret_params` - Map of secret parameters to create under `/secrets`

## Outputs

None

Let me know if you would like any changes or have additional questions!