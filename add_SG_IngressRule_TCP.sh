#!/bin/bash

# adds an ingress rule to a given security group at allows access on TCP port 22 from itself

echo -n "Enter valid sg-id: "    # Enter a valid security group id
read SG_ID

aws ec2 authorize-security-group-ingress \
        --group-id $SG_ID \
        --source-group $SG_ID \
        --protocol tcp \
        --port 22 \
