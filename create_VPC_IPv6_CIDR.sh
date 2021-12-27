#!/bin/bash

# Create VPC With Amazon-provided IPv6 CIDR block.

echo -n "Enter Ipv4 for creation: "
read $IPv4_CIDR
echo -n "Give VPC a name: "
read $VPC_NAME

aws ec2 create-vpc --cidr-block $IPv4_CIDR \
--amazon-provided-ipv6-cidr-block \
--tag-specifications \
"ResourceType=vpc,Tags=[{Key=Name,Value='$VPC_NAME'}]"
