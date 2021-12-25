#/bin/bash

# Takes a VPC ID and retrieves VPC description

echo "Enter VPC ID: "
aws ec2 describe-vpcs --vpc-ids "$1"  
