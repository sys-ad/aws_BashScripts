#!/bin/bash

# Creates an Elastic IP, NAT Gateway, and route in existing route tables.

echo "Create EIP to be used with NAT gateway: "
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc \
                -output text --query AllocationId)
                
if [ $? == 0 ]
then
    echo -n "Successfully created EIP"
else
    echo -n "Could not create EIP"
    exit
fi

# Create a NAT gateway within a public subnet (enter valid public subnet-id)

echo  -n "Enter valid public subnet-id: "
read SUBNET_ID

NAT_GATEWAY_ID=$(aws ec2 create-nat-gateway \
    --subnet-id $SUBNET_ID
    --allocation-id $ALLOCATION_ID \    # Associates created EIP (ALLOCATION_ID) with NAT gateway
    --output text --query NatGateway.NatGatewayId)
    
