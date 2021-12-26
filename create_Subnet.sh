#!/bin/bash

# Creates subnet, enter valid VPC ID
echo "Enter valid VPC ID: "
read -n VPC_ID
echo "Enter CIDR-Block: 'xxx.xxx.xxx.xxx/xx'"
read -n CIDR_
echo "Give subnet a name: "
read -n SUBNET_NAME
aws ec2 create-subnet --vpc-id $VPC_ID \
--cidr-block CIDR_ --availability-zone ${AWS_REGION}a \
--tag-specifications \
"ResourceType=subnet, Tags=[{Key=Name,Value='$SUBNET_NAME'}]" \
--output text --query Subnet.SubnetId)
