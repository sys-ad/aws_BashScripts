#!/bin/bash

# Creates an Elastic IP, NAT Gateway, and route in existing route tables.

echo -n "Creating EIP to be used with NAT gateway... "
sleep 5
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc \
                --output text --query AllocationId)

sleep 5

if [ $? == 0 ]
then
    echo "Successfully created EIP"
    sleep 5
else
    echo "Could not create EIP"
    sleep 5
    exit
fi

# Create a NAT gateway within a public subnet (enter valid public subnet-id)

echo  -n "Enter valid public subnet-id: "
read SUBNET_ID

NAT_GATEWAY_ID=$(aws ec2 create-nat-gateway \
    --subnet-id $SUBNET_ID \
    --allocation-id $ALLOCATION_ID \
    --output text --query NatGateway.NatGatewayId)

echo "loading....."
sleep 4
echo "loading...."
sleep 3
echo "loading..."
sleep 2
echo "loading.."
sleep 1
echo "loading."
sleep 10
echo  "..."
sleep 20
echo -n "Nat Gateway status: "

//aws ec2 describe-nat-gateways \
  //                 --nat-gateway-ids $NAT_GATEWAY_ID \
    //               --output text --query NatGateways[0].State

wait $!


echo "Creating route for default route (0.0.0.0/0) with destination to NAT Gateway:"
echo "Loading..."
echo "Loading...."
echo "Loading....."
echo "Loading......"
sleep 12

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
