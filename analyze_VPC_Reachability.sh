#!/bin/bash

# Tests access across subnets for connectivity (SSH)

echo "Creating network insights path... enter source (valid instance-id): "
read INSTANCE_ID1
echo "Enter destination (valid instance-id): "
read INSTANCE_ID2

INSIGHTS_PATH_ID=$(aws ec2 create-network-insights-path \
    --source $INSTANCE_ID1 --destination-port 22 \
    --destination $INSTANCE_ID2 --protocol tcp \
    --output text --query NetworkInsightsPath.NetworkInsightsPathId)
