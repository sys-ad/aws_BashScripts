#!/bin/bash

# AWS Cli install for x84_64-bit Linux. Note: It is recommended uninstalling awscli if previous versions installed prior to installing.

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
