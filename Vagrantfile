# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Fixes "stdin: is not a tty" and "mesg: ttyname failed : Inappropriate ioctl for device" messages --> mitchellh/vagrant#1673
  
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  
  #config.vm.box = "bento/ubuntu-16.04"
  config.vm.box = "geerlingguy/ubuntu1604"

  config.vm.provision :shell , inline: "(grep -q 'mesg n' /root/.profile && sed -i '/mesg n/d' /root/.profile && echo 'Ignore the previous error, fixing this now...') || exit 0;"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.

  config.vm.network "private_network", ip: "192.168.10.10"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.synced_folder "./", "/vagrant", disabled: true
  config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
    vb.name = "vagrant-lemp"
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "512"
  end

  config.vm.provision "shell" do |s|
    s.path = "provision.sh"
  end

end
