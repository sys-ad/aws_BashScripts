#!/bin/bash

# Given the Path to localized configuration (json) policy file, this script applies an S3 
# lifecycle policy onto an existing bucket.
# usage example: ./apply_S3lifecycle_IA.sh <file://nameofpolicy-rule.json>
# Note that the policy should be in a valid schema for the s3api to acknowledge and apply it.

echo -n "Enter existing bucket name: "
read NAME
aws s3api put-bucket-lifecycle-configuration --bucket $NAME --lifecycle-configuration "$1"


