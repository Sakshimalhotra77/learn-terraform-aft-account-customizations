# Amazon GuardDuty Terraform Configuration

This Terraform configuration is designed to set up Amazon GuardDuty, a threat detection service that continuously monitors for malicious activity and unauthorized behavior to protect your AWS accounts, workloads, and data.

## Prerequisites

- Terraform installed on your local machine or server
- AWS account with appropriate permissions to create and configure GuardDuty

## Usage

1. Clone this repository or copy the contents of the `main.tf` file.
2. Customize the variables in the `variables.tf` file according to your requirements.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform plan` to see the changes that will be applied.
5. Run `terraform apply` to create the GuardDuty resources.

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `enabled` | Enable or disable the GuardDuty service | `true` |
| `finding_publishing_frequency` | The frequency of findings publication (e.g., SIX_HOURS, ONE_DAY) | `"ONE_DAY"` |
| `allow_public` | Allow public access to the GuardDuty resources | `false` |

## Outputs

| Output | Description |
|--------|-------------|
| `guardduty_detector_id` | The ID of the created GuardDuty detector |

## Cleanup

To remove the GuardDuty resources created by this configuration, run `terraform destroy`.

## Additional Resources

- [Amazon GuardDuty Documentation](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## License

This project is licensed under the [MIT License](LICENSE).