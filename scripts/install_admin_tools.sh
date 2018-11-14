#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

echo ">>> Installing things that Irving cares about"
yum -y install lvm2 xfsprogs python-setuptools yum-utils git wget tuned sysstat iotop perf nc telnet vim awscli bash-completion lsof mlocate

echo ">>> Installing things that Siebrand cares about"
yum install -y bzip2 nfs-utils nmap screen tmpwatch tree zip

echo ">>> Installing AWS CloudFormation Helper Scripts"
/usr/bin/easy_install --script-dir /opt/aws/bin https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz
for i in `/bin/ls -1 /opt/aws/bin/`
do
    ln -sf /opt/aws/bin/$i /usr/bin/
done

echo ">>> Installing EPEL-based sysadmin tools"
rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y atop bash-completion-extras htop iftop nload tcping

sync
