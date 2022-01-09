#!/bin/bash

# Creates bucket in desired region. Enter bucket name and valid region location name

echo -n "Give bucket a name: "
read BUCKET_NAME
echo -n "Enter valid region to create bucket: "
read REGION_

aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION_ \
    --create-bucket-configuration LocationConstraint=$REGION_    # Default region is us-east-1
   
