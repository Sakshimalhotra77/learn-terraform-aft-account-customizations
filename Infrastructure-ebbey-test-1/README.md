# AWS Sandbox Environment with EC2 Instances

This Terraform configuration sets up a sandbox environment on AWS using various services, including EC2 instances. The README provides an overview of the setup, security improvements, cost optimization tips, and a detailed cost breakdown.

## Overview

The sandbox environment consists of the following components:

- **VPC**: A Virtual Private Cloud (VPC) to host the resources in a logically isolated network.
- **Subnets**: Public and private subnets across multiple Availability Zones for high availability.
- **Internet Gateway**: Enables communication between the VPC and the internet.
- **NAT Gateway**: Allows instances in the private subnets to access the internet.
- **Security Groups**: Control inbound and outbound traffic to the instances.
- **EC2 Instances**: Amazon Elastic Compute Cloud (EC2) instances running in the private subnets.

## Security Improvements

To enhance the security of the sandbox environment, the following improvements can be implemented:

1. **Use AWS Secrets Manager**: Store sensitive data, such as database credentials or API keys, in AWS Secrets Manager instead of hardcoding them in the Terraform configuration files.

2. **Enable AWS Config**: Configure AWS Config to monitor and record changes to your AWS resources, helping you maintain compliance with security best practices.

3. **Implement AWS GuardDuty**: Enable AWS GuardDuty to continuously monitor for malicious activity and unauthorized behavior to protect your AWS accounts and workloads.

4. **Enable AWS CloudTrail**: Configure AWS CloudTrail to monitor and log all API calls made to your AWS account, providing visibility into user and resource activity.

5. **Use AWS Key Management Service (KMS)**: Utilize AWS KMS to manage and control the encryption keys used for encrypting data at rest, such as EBS volumes or S3 buckets.

6. **Enable AWS Security Hub**: Configure AWS Security Hub to provide a comprehensive view of your security alerts and security posture across your AWS accounts.

7. **Implement AWS Network Firewall**: Deploy AWS Network Firewall to filter and inspect inbound and outbound traffic at the VPC network perimeter.

## Cost Optimization Tips (AWS Well-Architected Framework)

To optimize costs while following the AWS Well-Architected Framework, consider the following tips:

1. **Rightsizing EC2 Instances**: Regularly review and adjust the instance types and sizes based on your actual resource requirements. Consider using AWS Cost Explorer and AWS Compute Optimizer to identify underutilized or overprovisioned instances.

2. **Use Reserved Instances or Savings Plans**: If you have steady-state workloads, leverage Reserved Instances or AWS Savings Plans to achieve significant cost savings compared to On-Demand pricing.

3. **Implement Automatic Scaling**: Configure Auto Scaling groups to automatically scale your EC2 instances up or down based on demand, ensuring you only pay for the resources you need at any given time.

4. **Enable AWS Budgets**: Set up AWS Budgets to receive alerts when your actual or forecasted costs exceed your predefined budget thresholds, allowing you to take proactive measures.

5. **Leverage Spot Instances**: For workloads that can tolerate interruptions, consider using Spot Instances, which can provide significant cost savings compared to On-Demand instances.

6. **Use AWS Cost Anomaly Detection**: Enable AWS Cost Anomaly Detection to identify and receive alerts when your costs deviate from expected patterns, helping you identify and address potential cost issues promptly.

7. **Implement AWS Resource Tagging**: Tag your AWS resources consistently with metadata, such as environment, project, or owner, to better track and allocate costs.

8. **Schedule Instances**: If your workloads have defined operating hours, schedule your EC2 instances to start and stop automatically, reducing costs during non-operational periods.

## Cost Breakdown

Here's a detailed cost breakdown for the AWS services used in this sandbox environment, based on the US East (N. Virginia) region. The rates are subject to change and may vary based on your specific configuration and usage patterns.

### EC2 Instances

- **Instance Type**: t3.micro (general-purpose instance, burstable performance)
- **On-Demand Pricing**: $0.0104 per hour
- **Daily Cost**: $0.2496 (assuming 24 hours of uptime)
- **Monthly Cost**: $7.488 (assuming 30 days)

### VPC, Subnets, Internet Gateway, and NAT Gateway

- **VPC**: No additional cost
- **Subnets**: No additional cost
- **Internet Gateway**: $0.028 per hour, plus data transfer costs
- **NAT Gateway**: $0.045 per hour, plus data transfer costs

Assuming 730 hours in a month (24 hours × 30 days):

- **Daily Cost for Internet Gateway**: $0.672
- **Monthly Cost for Internet Gateway**: $20.44
- **Daily Cost for NAT Gateway**: $1.08
- **Monthly Cost for NAT Gateway**: $32.85

### Security Groups

- **Security Groups**: No additional cost

### Data Transfer Costs

Data transfer costs vary based on the amount of data transferred and the source/destination. For a detailed breakdown, refer to the [AWS Data Transfer Pricing](https://aws.amazon.com/vpc/pricing/data-transfer/) page.

### Total Monthly Cost (Estimate)

The total monthly cost for the sandbox environment, including EC2 instances, VPC, Internet Gateway, and NAT Gateway, can be estimated as follows:

- **Total Monthly Cost**: $7.488 (EC2) + $20.44 (Internet Gateway) + $32.85 (NAT Gateway) = $60.788

Please note that this cost estimate is based on the specific configuration outlined in this README and does not include any additional services or data transfer costs. Actual costs may vary based on your usage patterns and additional resource provisioning.