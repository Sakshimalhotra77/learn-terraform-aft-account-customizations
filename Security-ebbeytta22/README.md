# Amazon GuardDuty Terraform Configuration

This Terraform configuration is designed to create and manage Amazon GuardDuty resources in your AWS environment. Amazon GuardDuty is a threat detection service that continuously monitors your AWS accounts and workloads for malicious activity and unauthorized behavior.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine
- An AWS account with appropriate permissions to create and manage GuardDuty resources

## Usage

1. Clone this repository or copy the contents of the `main.tf` file into your local Terraform directory.

2. Configure your AWS credentials by following the instructions in the [AWS Provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).

3. Review the `main.tf` file and modify any variables or settings as needed for your specific requirements.

4. Initialize the Terraform working directory:

   ```
   terraform init
   ```

5. Review the execution plan to see what resources will be created or modified:

   ```
   terraform plan
   ```

6. If the plan looks correct, apply the changes:

   ```
   terraform apply
   ```

   This will create or update the specified GuardDuty resources in your AWS account.

7. If you need to make changes later, modify the `main.tf` file and run `terraform plan` and `terraform apply` again.

8. When you're finished, you can remove the resources by running:

   ```
   terraform destroy
   ```

## Main.tf

The `main.tf` file contains the Terraform configuration for creating and managing Amazon GuardDuty resources. Here's a brief overview of the resources it creates:

- **aws_guardduty_detector**: This resource creates an Amazon GuardDuty detector, which is the primary resource for enabling GuardDuty in your AWS account.
- **aws_guardduty_ipset**: This resource creates an IP set for use with GuardDuty threat detection.
- **aws_guardduty_threatintelset**: This resource creates a threat intelligence set for use with GuardDuty threat detection.

You can modify the variables and settings in the `main.tf` file to customize the behavior of the created resources.

## Variables

The following input variables are defined in the `variables.tf` file:

- `enable_guardduty`: A boolean flag to enable or disable the creation of GuardDuty resources. (default: `true`)
- `guardduty_detector_name`: The name of the GuardDuty detector. (default: `AWS-GuardDuty-Detector`)
- `guardduty_ipset_name`: The name of the GuardDuty IP set. (default: `AWS-GuardDuty-IPSet`)
- `guardduty_ipset_format`: The format of the IP addresses in the IP set. Valid values are `TXT` or `BINARY`. (default: `TXT`)
- `guardduty_ipset_activate`: Whether to activate the IP set. (default: `true`)
- `guardduty_threatintelset_name`: The name of the GuardDuty threat intelligence set. (default: `AWS-GuardDuty-ThreatIntelSet`)
- `guardduty_threatintelset_activate`: Whether to activate the threat intelligence set. (default: `true`)

## Outputs

The following outputs are defined in the `outputs.tf` file:

- `guardduty_detector_id`: The ID of the created GuardDuty detector.
- `guardduty_ipset_id`: The ID of the created GuardDuty IP set.
- `guardduty_threatintelset_id`: The ID of the created GuardDuty threat intelligence set.

## Contributing

If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request.