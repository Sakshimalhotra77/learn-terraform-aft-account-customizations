Here is a Terraform module for AWS CloudTrail:

```hcl
module "cloudtrail" {
  source = "your-org-name/cloudtrail/aws"

  name   = "my-cloudtrail"
  bucket = aws_s3_bucket.logs.id

  is_organization_trail = true

  event_selectors = [
    {
      read_write_type           = "All"
      include_management_events = true

      data_resource = {
        type = "AWS::S3::Object"
        # Make sure to append a trailing '/' to your ARN if you want
        # to monitor all objects in a bucket.
        values = ["arn:aws:s3:::"]
      }
    }
  ]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

This defines a CloudTrail module that enables logging across all AWS events in your organization to an S3 bucket. It sets some tags and a basic event selector. You would still need to define the `aws_s3_bucket` resource for the logs separately.

The module source follows the recommended convention you provided, so that this module could be published and shared across your organization.

Let me know if you need any other services configured! I can create additional Terraform resource blocks for any other AWS services as needed.