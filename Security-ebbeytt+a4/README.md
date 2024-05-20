# Amazon GuardDuty Terraform Configuration

This Terraform configuration provides a way to enable and manage Amazon GuardDuty, a threat detection service that monitors your Amazon Web Services (AWS) environment for malicious activity and unauthorized behavior.

## Prerequisites

Before using this Terraform configuration, you need to have the following:

- An AWS account
- Terraform installed on your local machine

## Usage

1. Clone this repository or copy the contents of the `main.tf` file.
2. Open a terminal and navigate to the directory containing the `main.tf` file.
3. Run `terraform init` to initialize the Terraform working directory.
4. Review the `main.tf` file and modify any settings as needed.
5. Run `terraform plan` to see the changes that will be made to your AWS environment.
6. If the proposed changes look correct, run `terraform apply` to create or update the Amazon GuardDuty resources.

## Main.tf

The `main.tf` file contains the following resources:

1. **aws_guardduty_detector**: This resource enables Amazon GuardDuty and configures various settings such as data sources, findings export, and notification settings.

## Inputs

The following input variables can be customized in the `main.tf` file:

- `enable` (bool): Specifies whether Amazon GuardDuty should be enabled or disabled (default: true).
- `finding_publishing_frequency` (string): Specifies the frequency for exporting findings (default: SIX_HOURS).
- `datasources` (map(string)): A map of data source configurations for Amazon GuardDuty. See the AWS documentation for available options.
- `export_config` (map(string)): A map of export configurations for Amazon GuardDuty findings. See the AWS documentation for available options.
- `notification_config` (map(string)): A map of notification configurations for Amazon GuardDuty findings. See the AWS documentation for available options.

## Outputs

The following outputs are available after applying the Terraform configuration:

- `guardduty_detector_id`: The ID of the Amazon GuardDuty detector.

## Additional Resources

- [Amazon GuardDuty User Guide](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html)
- [Terraform aws_guardduty_detector Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector)