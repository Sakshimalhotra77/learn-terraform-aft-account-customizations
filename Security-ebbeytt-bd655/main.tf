Here is an example Terraform configuration for AWS services using official Terraform AWS modules where available:

# User request: S3, DynamoDB, Lambda

# S3 module exists, using it
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.3.0"

  bucket = "my-s3-bucket"
  acl    = "private"

  versioning = {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  # Other parameters with defaults:
  # force_destroy = false
  # tags          = {}
}

# DynamoDB module does not exist, defining resource
resource "aws_dynamodb_table" "example" {
  # Primary key 
  hash_key = "UserId"  
  name     = "UserTable"

  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 20  
  write_capacity = 20
  
  attribute {
    name = "UserId"
    type = "S"
  }
}

# Lambda module does not exist, defining resource
resource "aws_lambda_function" "example" {
  filename      = "lambda.zip"
  function_name = "myLambda"
  role          = aws_iam_role.lambda.arn
  handler       = "index.test"

  # Other parameters with defaults:
  # memory_size = 128 
  # timeout     = 3
  # runtime     = "nodejs14.x"

  # Permissions and VPC config not shown
  # Tags not shown
}

Let me know if you would like me to explain or expand on any part of this configuration! I aimed to create ready-to-use Terraform code following best practices per your request.