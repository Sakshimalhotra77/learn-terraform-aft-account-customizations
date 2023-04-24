provider "aws" {
  region  = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::116515616857:role/aft-tfe-token-role"
  }
  alias = "aft"
}

data "aws_secretsmanager_secret_version" "tfe_token_secret" {
  secret_id = "tfe-token-app-secret"
  provider  = aws.aft
}
