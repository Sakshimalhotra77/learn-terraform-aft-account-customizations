# Amazon GuardDuty Terraform Configuration

This Terraform configuration provides a way to manage Amazon GuardDuty, a threat detection service that continuously monitors for malicious activity and unauthorized behavior to protect your AWS accounts and workloads.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) 0.14 or later
- An AWS account with appropriate permissions to manage GuardDuty

## Usage

1. Clone this repository or copy the contents of the `main.tf` file.
2. Customize the variables in the `variables.tf` file as needed.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform plan` to see the changes that Terraform will make.
5. Run `terraform apply` to create or update the GuardDuty resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable_guard_duty | Whether to enable GuardDuty or not | `bool` | `true` | no |
| detector_id | The ID of the GuardDuty detector to use | `string` | `null` | no |
| finding_publishing_frequency | The frequency to publish GuardDuty findings | `string` | `SIX_HOURS` | no |
| publish_to_cloudwatch | Whether to publish GuardDuty findings to CloudWatch | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| guard_duty_detector_id | The ID of the GuardDuty detector |

## Resources

- [aws_guardduty_detector](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector)
- [aws_guardduty_publishing_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_publishing_destination)

## Examples

For a complete example, refer to the `examples` directory.

## License

This project is licensed under the [MIT License](LICENSE).