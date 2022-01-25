#!/bin/bash

# Tests access across subnets for connectivity (SSH)

echo -n "Creating network insights path... enter source (valid instance-id): "
read INSTANCE_ID1
echo -n "Enter destination (valid instance-id): "
read INSTANCE_ID2

INSIGHTS_PATH_ID=$(aws ec2 create-network-insights-path \
    --source $INSTANCE_ID1 --destination-port 22 \
    --destination $INSTANCE_ID2 --protocol tcp \
    --output text --query NetworkInsightsPath.NetworkInsightsPathId)

# Implement a wait response here..

echo -n "Starting ingsights analysis of instances..."
