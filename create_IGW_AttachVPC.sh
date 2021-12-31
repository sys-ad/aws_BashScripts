#!/bin/bash

# Create internet gateway (IGW) and attach it to an existing VPC,

echo -n "Create IGW; Give it a name: "
read IGW

INET_GATEWAY_ID=$(aws ec2 create-internet-gateway \
                --tag-specifications "ResourceType=internet-gateway,Tags=[{Key=Name,Value='$IGW'}]" \
        --output text --query InternetGateway.InternetGatewayId)

if [ $? == 0 ]
then
echo -n "Attach IGW to existing VPC, enter VPC-Id: "
read VPC_ID
aws ec2 attach-internet-gateway \
--internet-gateway-id $INET_GATEWAY_ID --vpc-id $VPC_ID
else
echo -n "Failed to create IGW"
fi

if [ $? == 0 ]
then
echo "Successfully created IGW and attached it to existing VPC."
else
echo "Failed to create IGW or attach it to existing VPC"
fi
exit

