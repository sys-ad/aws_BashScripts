#!/bin/bash

# Creates an Elastic IP, NAT Gateway, and route in existing route tables.

echo -n "Create EIP to be used with NAT gateway: "
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc \
                -output text --query AllocationId)
                
if [ $? == 0 ]
then
    echo -n "Successfully created EIP"
else
    echo -n "Could not create EIP"
fi

# Create a NAT gateway within a public subnet (enter it from s
