#!/bin/bash

aws ec2 run-instances --key-name KEYNAME --instance-type t3.micro --image-id AMIID \
--user-data file:///home/ec2-user/UserData.txt 
--security-group-ids HTTPACCESS 
--subnet-id SUBNETID 
--associate-public-ip-address 
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServerBaseImage}]' 
--output text --query 'Instances[*].InstanceId'

