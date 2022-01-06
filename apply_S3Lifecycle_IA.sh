#!/bin/bash

# Applies Lifecycle rule configuration (json)

echo -n "Enter path of policy file: "
read PATH

aws s3api put-bucket-lifecycle-configuration \
    --bucket 
