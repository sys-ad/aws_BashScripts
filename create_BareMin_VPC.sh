#!/bin/bash

# Takes two arguments: $1: cidr-block IP and $2: name of VPC

VPC_ID=$(aws ec2 create-vpc --cidr-block "$1" --tag-specifications "ResourceType=vpc,Ta
gs=[{Key=Name,Value="$2"}]" --output text --query Vpc.VpcId)
