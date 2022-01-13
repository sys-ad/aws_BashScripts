#!/bin/bash

# adds an ingress rule to a given security group at allows access on given
# port and protocol

echo -n "Enter valid sg-id: "    # Enter a valid security group id
read SG_ID
echo -n "Enter protocol name: "
read PROTOCOL_
echo -n "Enter port number: "
read PORT_

# If ingress rule is aready applied, error message will return
aws ec2 authorize-security-group-ingress \
        --group-id $SG_ID \
        --source-group $SG_ID \
        --protocol $PROTOCOL_ \
        --port $PORT_ \
