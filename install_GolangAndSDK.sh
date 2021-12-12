#!/bin/bash
# Install Golang 1.17.5 and the AWS SDK for Go 
sudo yum install -y golang
sudo go get -u github.com/aws/aws-sdk-go

# Add "export PATH=$PATH:/usr/local/go/bin" to your environment variable or add this line unto /etc/profile 
