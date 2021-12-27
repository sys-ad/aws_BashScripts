#!/bin/bash

# Associate route table to subnet

echo -n "Enter route-table Id: "
read ROUTE_TABLE_ID
echo -n "Enter subnet-Id: "
read SUBNET_ID

aws ec2 associate-route-table \
    --route-table-id $ROUTE_TABLE_ID --subnet-id $SUBNET_ID
