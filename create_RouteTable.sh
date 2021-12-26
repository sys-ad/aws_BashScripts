#!/bin/bash

# Creates route table. 

echo -n "Enter VPC ID: "
read VPC_ID
VPC_ID = $VPC_ID
echo -n "Give route table name: "
read route_name
route_name = $ROUTE_NAME
aws ec2 create-route-table --vpc-id $VPC_ID \
--tag-specifications 'ResourceType=route-table,Tags={Key=Name,Value=$ROUTE_NAME}]' --output text --query RouteTable.RouteTableId)
