#!/bin/bash

# Creates route in routing table which will direct traffic to the internet gateway. 
# IGW must be attached to a VPC

echo -n "Enter valid route-table-id: "
read RTB_ID
echo -n "Enter valid internet gateway id: "
read IGW_ID

aws ec2 create-route --route-table-id $RTB_ID \
--destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
