# High Performance CentOS 7 AMI

The stock RHEL and CentOS AMIs are highly unoptimized and typically out of date. The maintainers are impossible to contact and not responsive. This project aims to create a high-performance CentOS 7 image that is unencumbered of product codes or other restrictions.

It is based on https://github.com/irvingpop/packer-chef-highperf-centos7-ami, but without Chef and Docker, more modular, and with some extra packages.

Credit to the DCOS team, this project is based on their [CentOS 7 cloud image](https://github.com/dcos/dcos/tree/master/cloud_images/centos7)

# Usage

## Building your own image

Simply set your `AWS_*` environment variables and run packer.  The easiest way to do this is to set up your profiles via `aws configure` and then export the correct `AWS_PROFILE` variable.
```
export AWS_PROFILE='myprofile'
packer build packer.json
```

Be aware that this means that you trust my AMI enough to build your image on. If you want to know for certain what you build, create a base AMI first using the script create_base_ami.sh in the root of this repository.

## Consuming existing AMIs

### Latest AMIs

Please consider AMIs expired 2 months after they were published. It may be around for longer, but using it then, is on borrowed time. Please contact me if you want to implement something specifically for you, of if you want me to reliably maintain a set of images for you.

The latest AMIs were Published on 2018/11/14:

```
eu-west-1: ami-0d92277784bf7001a
```

Changelog:
* Forked from  https://github.com/irvingpop/packer-chef-highperf-centos7-ami.
* Updated README.md.
* Updated packer.json with own sources and names.
* Updated packer.json provisioners to be modular.
* Added module scripts for Amazon SSM agent, and Puppet 5 client.
* Tested, updated and documented create_base_ami.sh script to create a CentOS base AMI from scratch.
* Added packages to admin tools: nfs-utils nmap screen tmpwatch tree zip htop tcping puppet.
* Disabled modules that install Chef Workstation and Docker.
* Disabled module that disables rsyslog.

----

### Previous AMIs

Published on 2018/10/31:

```
ca-central-1: ami-082b857c6ad643ad5
eu-central-1: ami-0cb5372cf96c049b5
eu-west-1: ami-0a1a03058ad1dd657
eu-west-2: ami-06e54a9d35305fe03
eu-west-3: ami-01e2c6ae2055c7ad7
sa-east-1: ami-04be093d34af1162f
us-east-1: ami-0dd362a0723a5824f
us-east-2: ami-0bd1af97fd2616315
us-west-1: ami-0de1be25a7e1e65a5
us-west-2: ami-05c8e42d85f60b86b
```

Changelog:
* Latest security and bugfix updates for all the things
* Still on CentOS 7.5, as 7.6 is still in beta
