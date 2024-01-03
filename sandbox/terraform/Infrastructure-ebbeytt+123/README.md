Here is a draft README for the Terraform configuration based on the user request for vpc-peering, transit-gateway, and image-builder:

# Terraform Configuration

## Overview

This Terraform configuration sets up:

- VPC Peering between two VPCs
- Transit Gateway to connect the VPCs 
- Image Builder to build custom AMIs

## VPC Peering

The Terraform code defines two VPCs and creates a peering connection between them. This allows resources in the VPCs to communicate with each other as if they are within the same network.

Key resources configured:

- aws_vpc - Defines the two VPCs
- aws_vpc_peering_connection - Creates the peering connection
- aws_route - Adds routes in each VPC routing table to route traffic to the peered VPC 

## Transit Gateway

A transit gateway is configured to connect the two VPCs. This acts as a hub that VPCs and on-premises networks can connect to to enable communication between them.

Key resources:

- aws_ec2_transit_gateway - Defines the transit gateway
- aws_ec2_transit_gateway_vpc_attachment - Attaches the VPCs to the transit gateway
- aws_route - Routes in the VPC route tables are updated to route inter-VPC traffic through the transit gateway

## Image Builder

AWS Image Builder is used to define a pipeline for building custom Amazon Machine Images (AMIs). This automates the creation, testing and distribution of the AMIs to the different accounts.

Key resources:

- aws_imagebuilder_component - Components that define the base OS and settings 
- aws_imagebuilder_infrastructure_configuration - The instance profile and subnets to use for Image Builder
- aws_imagebuilder_image_recipe - The steps for installing software and customizing the AMI
- aws_imagebuilder_image_pipeline - The pipeline that uses the recipe to build, test and distribute the AMI

The Image Builder resources work together to output the customized AMI that can then be launched in either of the VPCs.

Let me know if you need any clarification or have additional questions!