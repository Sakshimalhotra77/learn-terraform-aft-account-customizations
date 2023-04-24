provider "aws" {
  region  = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::958634353777:role/aft-tfe-token_role"
  }
  alias = "aft"
}

data "aws_secretsmanager_secret_version" "tfe_token_secret" {
  secret_id = "tfe-token-app-secret"
  provider  = aws.aft
}
