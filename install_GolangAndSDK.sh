#!/bin/bash
# Install Golang 1.17.5 and the AWS SDK for Go 

wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz    # ----- Latest Go version, updated 12/19/2021
sudo tar -C /usr/local -xzf https://go.dev/dl/go1.17.5.linux-amd64.tar.gz   # ----- Extracts gzip file and creates directory
export = PATH=$PATH:/usr/local/go/bin    # ---- Add /usr/local/go/bin to the PATH environment variable
                                         # ---- Add above line to $HOME/.profile or /etc/profile (for a system-wide installation
go mod init example    # ---- Initializes your local project in current working directoty. Make a seperate directory recommended
                       # ---- example: sudo mkdir test_Go
# Retrive Go SDK and its required dependencies using the 'go get' cmd/sub cmd. This will allow your localized Go project access to 
# the Go SDK AWS Modules.
go get github.com/aws/aws-sdk-go-v2
go get github.com/aws/aws-sdk-go-v2/config


