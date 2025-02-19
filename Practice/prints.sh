#!/bin/bash
set -x #enables debugmode
echo "Running AWS CLI command to list EC2 instances..."
# Ensure AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "AWS CLI is not configured or credentials are missing. Please run 'aws configure'."
    exit 1
fi

# List all EC2 instances
echo "Fetching EC2 instances..."

# Using AWS CLI to describe instances and filter out necessary information
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, InstanceType, PublicIpAddress, PrivateIpAddress, State.Name]" --output table