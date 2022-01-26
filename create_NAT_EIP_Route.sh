#!/bin/bash

# Creates an Elastic IP, NAT Gateway, and route in existing route tables.

echo "Create EIP to be used with NAT gateway: "
sleep 10
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc \
                -output text --query AllocationId)
                
sleep 5
                
if [ $? == 0 ]
then
    echo -n "Successfully created EIP"
    sleep 5
else
    echo -n "Could not create EIP"
    sleep 5
    exit
fi

# Create a NAT gateway within a public subnet (enter valid public subnet-id)

echo  -n "Enter valid public subnet-id: "
read SUBNET_ID

NAT_GATEWAY_ID=$(aws ec2 create-nat-gateway \
    --subnet-id $SUBNET_ID \
    --allocation-id $ALLOCATION_ID \    # Associates created EIP (ALLOCATION_ID) with NAT gateway
    --output text --query NatGateway.NatGatewayId)

sleep 25

aws ec2 describe-nat-gateways \
    --nat-gateway-ids $NAT_GATEWAY_ID \
    --output text --query NatGateways[0].State
    
echo -n "Creating route for default route (0.0.0.0/0) with destination to NAT Gateway:"
echo -n "Loading..."
sleep 10

echo -n "Enter valid private rtb-id: "
read $RTB_ID
aws ec2 create-route --route-table-id $RTB_ID \
    --destination-cidr-block 0.0.0.0/0 \
    --nat-gateway-id $NAT_GATEWAY_ID



