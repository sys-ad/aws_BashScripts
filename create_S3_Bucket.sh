#!/bin/bash

# Simple script using the CLI API for s3 resource
 
echo -n "Enter bucket name to create bucket(must be unique): "
read BUCKET_NAME

aws s3api create-bucket -bucket $BUCKET_NAME --region us-east-1    # Regions outside of us-east-1 require the appropriate LocationConstraint to be specified for desired region

