Here is a Terraform configuration that sets up SSM Parameter Store parameters for a high-availability web application:

```hcl
# SSM parameter for database username
resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.app_name}/db/username"
  type  = "SecureString"
  value = random_string.db_username.result
}

# SSM parameter for database password  
resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.app_name}/db/password"
  type  = "SecureString"
  value = random_password.db_password.result
}

# SSM parameter for application secret key
resource "aws_ssm_parameter" "app_secret_key" {
  name  = "/${var.app_name}/app/secret_key"
  type  = "SecureString" 
  value = random_string.app_secret_key.result
}

# Random string to generate a database username  
resource "random_string" "db_username" {
  length  = 16
  special = false
}

# Random password to generate a database password
resource "random_password" "db_password" {
  length  = 20
  special = true  
}

# Random string to generate an application secret key
resource "random_string" "app_secret_key" {
  length  = 32
  special = true
}
```

This stores sensitive values like database credentials and secret keys securely in SSM Parameter Store. The parameters are named in a logical hierarchy based on the application name, making it easy to manage.

The random provider generates a secure random string/password for each parameter. Using the SSM parameter ARNs, the application can retrieve these values at runtime without hardcoding secrets.

Some additional best practices would be enabling parameter rotation, access controls, and logging. But this covers the basics of managing application secrets with SSM Parameter Store.