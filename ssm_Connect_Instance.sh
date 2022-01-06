#!/bin/bash

# Use SSM to connect to Instance

echo -n "Enter valid Instance ID: "    
read INSTANCE_ID

aws ssm start-session --target $INSTANCE_ID    # Use Systems Session Manager to connect to an instance through CLI
