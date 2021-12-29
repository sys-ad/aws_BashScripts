#!/bin/bash

# Retrieves meta-data on a subnet; Enter valid subnet-Id.

echo -n "Enter valid subnet-ID: "
read SUBNET_ID

aws ec2 decscribe-subnets --subnet-ids $SUBNET_ID
