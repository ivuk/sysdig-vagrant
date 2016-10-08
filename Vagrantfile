# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$provsh = <<SCRIPT
echo 'Importing sysdig GPG key'
wget -q -O - https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | \
    apt-key add -
echo 'Adding the sysdig repository to sources.list.d/'
wget -q -O /etc/apt/sources.list.d/draios.list \
    http://download.draios.com/stable/deb/draios.list

echo 'Running apt-get update'
apt-get -qq update

echo 'Installing kernel headers'
apt-get -qq install linux-headers-"$(uname -r)"
echo 'Installing the sysdig package'
apt-get -qq install sysdig
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubu1604-sysdig"
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision :shell, :inline => $provsh
end
