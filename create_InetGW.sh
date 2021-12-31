#!/bin/bash

# Create an internet gateway (IGW). The Internet Gateway enables your Cloud resources to connect to the internet.

echo -n "Give IGW a name: "
read IGW

aws ec2 create-internet-gateway \
        --tag-specifications \
        "ResourceType=internet-gateway,Tags=[{Key=Name,Value='$IGW'}]" \
        --output text --query InternetGateway.InternetGatewayId
