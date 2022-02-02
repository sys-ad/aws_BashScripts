#!/bin/bash

echo -n "give your bucket a name: "
read BUCKET_NAME
aws s3api create-bucket --bucket $BUCKET_NAME

echo -n "enabling versioning..."

aws s3api put-bucket-versioning \
    --bucket $BUCKET_NAME \
    --versioning-configuration Status=Enabled
    
   


