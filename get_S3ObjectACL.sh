#!/bin/bash

# Retrives Object (S3) ACL

echo -n "Enter S3 Bucket: "
read BUCKET_NAME
echo -n "Enter Object: "
read OBJECT

aws s3api get-object-acl --bucket $BUCKET_NAME  --key $OBJECT


