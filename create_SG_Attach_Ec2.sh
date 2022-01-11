#!/bin/bash

# Create security group and attaches to instance

echo -n "Give security group a name: "
read SG_NAME
echo -n "Enter valid vpc-id: "
read VPC_ID

SG_ID=$(aws ec2 create-security-group \
    --group-name $SG_NAME \
    #--description ""                  Note: Optional
    --vpc-id $VPC_ID \
    output text --query GroupId)
    
 
