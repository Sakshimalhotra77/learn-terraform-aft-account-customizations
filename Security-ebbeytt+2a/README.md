# Amazon GuardDuty Terraform Configuration

This Terraform configuration provides a way to manage Amazon GuardDuty, a threat detection service that continuously monitors for malicious activity and unauthorized behavior to protect your AWS accounts and workloads.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine
- An AWS account with appropriate permissions to create and manage GuardDuty resources

## Usage

1. Clone this repository or copy the contents of the `main.tf` file.
2. Navigate to the directory containing the `main.tf` file.
3. Initialize the Terraform working directory by running:

```
terraform init
```

4. Review the configuration in `main.tf` and make any necessary changes to suit your requirements.
5. Apply the configuration by running:

```
terraform apply
```

This will create the necessary GuardDuty resources in your AWS account.

## Configuration

The `main.tf` file contains the following resources:

- `aws_guardduty_detector`: This resource creates an Amazon GuardDuty detector, which is the primary resource for enabling GuardDuty in your AWS account.
- `aws_guardduty_member`: This resource allows you to add member AWS accounts to the GuardDuty detector, enabling centralized monitoring and threat detection across multiple accounts.
- `aws_guardduty_ipset`: This resource creates an IP set, which is a list of trusted IP addresses that can be used to filter GuardDuty findings.
- `aws_guardduty_threatintelset`: This resource creates a threat intel set, which is a list of known malicious IP addresses and domains that can be used to generate GuardDuty findings.

You can customize the configuration by modifying the resource arguments in `main.tf`. For example, you can enable or disable specific GuardDuty findings, configure data sources, or set up centralized monitoring across multiple AWS accounts.

## Outputs

The `outputs.tf` file defines the outputs that will be displayed after applying the configuration. By default, it outputs the GuardDuty detector ID and the member account IDs added to the detector.

## Cleanup

To remove the GuardDuty resources created by this configuration, run:

```
terraform destroy
```

This will delete all resources associated with the configuration from your AWS account.

## Contributing

If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.