Here's the modular Terraform code for Amazon Inspector, Amazon GuardDuty, AWS Security Hub, with necessary comments:

```hcl
# Amazon Inspector
module "aws_inspector" {
  source = "./modules/aws_inspector"

  # Module Parameters
  # ... (Add your module parameters here)
}

# Amazon GuardDuty
module "aws_guardduty" {
  source = "./modules/aws_guardduty"

  # Module Parameters
  # ... (Add your module parameters here)
}

# AWS Security Hub
module "aws_securityhub" {
  source = "./modules/aws_securityhub"

  # Module Parameters
  # ... (Add your module parameters here)
}

# AWS Config
resource "aws_config_configuration_recorder" "config_recorder" {
  name     = "config-recorder"
  role_arn = aws_iam_role.config_role.arn
}

resource "aws_iam_role" "config_role" {
  name = "config-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "config_role_policy_attachment" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

# AWS CloudTrail
resource "aws_cloudtrail" "main_trail" {
  name                          = "main-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = true
  is_multi_region_trail         = true
}

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = "cloudtrail-bucket-name"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id
  policy = data.aws_iam_policy_document.cloudtrail_bucket_policy.json
}

data "aws_iam_policy_document" "cloudtrail_bucket_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.id}"]
  }

  statement {
    effect    = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.id}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

data "aws_caller_identity" "current" {}
```

This code includes the following:

- Module definitions for Amazon Inspector, Amazon GuardDuty, and AWS Security Hub. You'll need to provide the necessary parameters for each module.
- A resource configuration for AWS Config, including an AWS Config recorder and an IAM role with the required permissions.
- A resource configuration for AWS CloudTrail, including a CloudTrail trail, an S3 bucket to store the logs, and a bucket policy to allow CloudTrail to write logs to the bucket.

Note: This code assumes that you have separate module directories for Amazon Inspector, Amazon GuardDuty, and AWS Security Hub. If not, you'll need to include the relevant resource configurations within the main file.