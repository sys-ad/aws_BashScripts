#!/bin/bash

# Creates a Ec2 instance with a running apache server. Note: Enter existing security group and subnet id's

# Set the Region
AZ=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
export AWS_DEFAULT_REGION=${AZ::-1}


# Obtain latest Linux AMI
AMI=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text)
echo $AMI

echo -n "Enter valid subnet-id: "
read SUBNET_ID
echo -n "Enter valid valid sg-id: "
read SG_ID
echo -n "Give your web server a name: "
read SERVER_NAME

#Download user data script
wget https://aws-tc-largeobjects.s3.amazonaws.com/CUR-TF-100-RESTRT-1/171-lab-%5BJAWS%5D-create-ec2/UserData.txt

INSTANCE=$(\
aws ec2 run-instances \
--image-id $AMI \
--subnet-id $SUBNET_ID \
--security-group-ids $SG_ID \
--user-data file:///home/ec2-user/UserData.txt \
--instance-type t2.micro \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$SERVER_NAME}]" \
--query 'Instances[*].InstanceId' \
--output text \
)
echo $INSTANCE

aws ec2 describe-instances --instance-ids $INSTANCE

# Test to see if the server is running
aws ec2 describe-instances --instance-ids $INSTANCE --query 'Reservations[].Instances[].State.Name' --output text
aws ec2 describe-instances --instance-ids $INSTANCE --query Reservations[].Instances[].PublicDnsName --output text
