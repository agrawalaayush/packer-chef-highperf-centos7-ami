#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

echo ">>> Installing Puppet client"
yum install -y https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y puppet
# puppet is not enabled, because not everyone may like that
