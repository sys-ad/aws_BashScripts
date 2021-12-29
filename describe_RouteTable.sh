#!/bin/bash 

# retrieves metadata on route-table, enter valid rtb-id

echo -n "Enter route-table ID: "
read RTB_ID
aws ec2 describe-route-tables --route-table-ids $RTB_ID

