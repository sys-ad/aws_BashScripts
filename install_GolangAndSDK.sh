#!/bin/bash
# Install Golang 1.17.5 and the AWS SDK for Go 
wget "http://go.dev/d1/go1.17.5.linux-amd64.tar.gz" -o "go1.17.5.linux-amd64.tar" 
#     ^check https://go.dev/doc/install for latest version(s)^
tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
