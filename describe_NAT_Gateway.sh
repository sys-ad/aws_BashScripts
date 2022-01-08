#!/bin/bash

# Describes the state of a NAT gateway, once its been attached with an elastic IP

echo -n "Enter valid nat-gateway-id: "
read NAT_GATEWAY_ID

aws ec2 describe-nat-gateways \
    --nat-gateway-ids $NAT_GATEWAY_ID \
    --output text --query NatGateways[0].State
