Here is a draft README for a Terraform configuration with KMS, WAF, Shield, and Certificate Manager resources:

# Terraform AWS Infrastructure

This Terraform configuration sets up key AWS infrastructure components:

## KMS

- Creates a KMS key for encrypting and decrypting data
- Enables key rotation
- Grants usage permissions to other accounts/resources

## WAF

- Deploys a Web Application Firewall to filter malicious web traffic 
- Sets up rules to block common attacks like SQL injections, XSS, etc.
- Enables integration with ALB and CloudFront

## Shield

- Activates AWS Shield Advanced for DDoS protection
- Shield is enabled on ALB, CloudFront distributions etc.

## Certificate Manager

- Requests SSL/TLS certificates from Amazon Certificate Manager
- Certificates are used on the ALB and CloudFront for HTTPS
- Auto renewal is configured to ensure certificates stay valid

The resources follow security best practices including encryption, restricted access, and infrastructure hardening.

Let me know if you would like me to modify or add any additional details to this draft README! I'm happy to refine it further based on your infrastructure plans and requirements.