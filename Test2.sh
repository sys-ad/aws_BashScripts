#!/bin/bash

# Creates an Elastic IP, NAT Gateway, and route in existing route tables.

echo -n "Creating EIP to be used with NAT gateway... "
sleep 5
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc \
                --output text --query AllocationId)

sleep 3

if [ $? == 0 ]
then
    echo "Successfully created EIP"
    sleep 1
else
    echo "Could not create EIP"
    sleep 1
    exit
fi

# Create a NAT gateway within a public subnet (enter valid public subnet-id)

echo  -n "Enter valid public subnet-id: "
read SUBNET_ID

NAT_GATEWAY_ID=$(aws ec2 create-nat-gateway \
    --subnet-id $SUBNET_ID \
    --allocation-id $ALLOCATION_ID \
    --output text --query NatGateway.NatGatewayId)

#//aws ec2 describe-nat-gateways \
#  //                 --nat-gateway-ids $NAT_GATEWAY_ID \
 #   //               --output text --query NatGateways[0].State

wait $!

echo "Creating route for default route (0.0.0.0/0) with destination to NAT Gateway:"
echo "Loading..."
echo "Loading...."
echo "Loading....."
echo "Loading......"

sleep 1

echo -n "Enter valid private rtb-id: "
read RTB_ID
aws ec2 create-route --route-table-id $RTB_ID \
    --destination-cidr-block 0.0.0.0/0 \
    --nat-gateway-id $NAT_GATEWAY_ID

if [ $? != 0 ]
then
echo  "Route already exists in route table"
else
echo  "Successfully added route to route table"
fi


