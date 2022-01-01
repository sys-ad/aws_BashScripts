#!/bin/bash

# Create Elastic IP and attach it to EC2

echo -n "Press enter to allocate EIP address to AWS account"
ALLOCATION_ID=$(aws ec2 allocate-adress --domain vpc \
              --output text --query AllocationId)
              
if [ $? == 0 ] 
then
    echo -n "Successfully created EIP"
else
    2>>error.log
fi

echo -n "Enter valid EC2 instance ID: "
read INSTANCE_ID
aws ec2 associate-adress \
    --instance-id $INSTANCE_ID --allocation-id $ALLOCATION_ID
  




    
   
