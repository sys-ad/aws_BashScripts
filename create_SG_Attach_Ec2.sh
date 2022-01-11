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
    
echo -n "Enter valid instance-id: "
read INSTANCE_ID

# Attach security group to instance

aws ec2 modify-instance-attribute --instance-id $INSTANCE_ID \
    --groups $SG_ID
    
 
