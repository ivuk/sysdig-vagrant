#!/bin/bash
#
# A bash script used in combination with Vagrant shell provider that sets up
# sysdig from Draios repository
#
# https://github.com/draios/sysdig/wiki/How%20to%20Install%20Sysdig%20for%20Linux#automatic-installation
#

# Download the GPG key and repository information
wget -q -O - https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | \
    apt-key add -
wget -q -O /etc/apt/sources.list.d/draios.list \
    http://download.draios.com/stable/deb/draios.list

# Resynchronize the package index files
apt-get -qq update

# Install kernel-headers package
# Install sysdig package from the repository
# Kernel module (DKMS) gets built and installed during installation
apt-get -qq install linux-headers-$(uname -r)
apt-get -qq install sysdig
