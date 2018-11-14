#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

echo ">>> Installing latest SSM agent"
systemctl status amazon-ssm-agent
if [ $? = 0 ]
then
    echo ">>>> SSM agent installed. Stop and remove it"
    systemctl stop amazon-ssm-agent
    rm -rf /var/log/amazon/ssm/*
    yum erase -y amazon-ssm-agent
else
    echo ">>>> SSM agent not yet installed"
fi
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl enable amazon-ssm-agent

sync
