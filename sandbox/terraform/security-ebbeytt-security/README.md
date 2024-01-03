Here is a draft README for a Terraform configuration to deploy WAF and AWS Shield:

# Terraform AWS WAF and Shield

This Terraform configuration sets up AWS WAF and enables AWS Shield on an AWS resource.

## Usage

The following resources are configured:

- AWS WAF web ACL - Creates a WAF web ACL to filter incoming web traffic based on rules. Rules can be added later to restrict IPs, block SQL injection etc.

- AWS WAF association - Associates the web ACL with an AWS resource like Application Load Balancer, API Gateway or CloudFront. This filters the traffic coming to that resource.

- AWS Shield - Enables AWS Shield Advanced for protecting against DDoS attacks on the selected resource. 

To use this module, update the `main.tf` with following details:

- AWS region
- Resource ARN to associate the WAF ACL
- Add more rules to the ACL as needed

Run `terraform init`, `terraform plan` and `terraform apply` to deploy resources.

Additional AWS services like CloudWatch metrics and SNS alerts can be configured to monitor the WAF and Shield. Security automation using Lambda can also be set up.

## Outputs

- WAF Web ACL ID
- WAF Web ACL ARN
- AWS Shield Protection ID

Review and modify this draft README based on the actual Terraform configuration and requirements.