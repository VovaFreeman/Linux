# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.ssh.username = 'vagrant'
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  # Tell Vagrant where would you like to start your VMs (you can also have a 
  # specific per-VM configuration. Do not put this section in case you want to 
  # start your VMs on the same host)
  config.vm.provider :libvirt do |libvirt| 
	libvirt.host = 'targethostnameOrIP' 
	libvirt.username = 'ubuntu' 
	libvirt.connect_via_ssh = true 
	libvirt.video_type = 'qxl'
	libvirt.video_vram = '65536'
  end 
  # Here's our VM confguration 
  config.vm.define :test_startup do |machine| 
  # It should be an Ubuntu 14.04 box 
  machine.vm.box = "ubuntu/trusty64" 
  # With a public IP (it's optional) 
  machine.vm.network :public_network, ip: '192.168.48.193'
  #, :dev => "virtbr0", :mode => 'bridge' 
  # With so much RAM and CPUs 
  machine.vm.provider :libvirt do |domain| domain.memory = 2048 
  domain.cpus = 2 
  end 
  # Finally, let's provision it by running a script. You can also run 
  # puppet, chef, ansible, and others. Check the Vagrant website for 
  # details. 
  #machine.vm.provision :shell, path: "bootstrap.sh", args: "42", keep_color: true 
  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
#hardcoded additional ssh keys import for ubuntu root users
#A try to mount system cdrom copied from the provision root folder
    s.inline = <<-SHELL
      cp /home/vagrant/.ssh/authorized_keys /home/ubuntu/.ssh/authorized_keys_$(date +%F_%T).old
      echo "#{ssh_pub_key}" > /home/ubuntu/.ssh/authorized_keys
      cp /root/.ssh/authorized_keys /root/.ssh/authorized_keys_$(date +%F_%T).old
      echo "#{ssh_pub_key}" > /root/.ssh/authorized_keys
      if ! [ -d "/media/cdrom" ]; then 
	mkdir "/media/cdrom"
      fi
      mount /vagrant/ubuntu*.iso /media/cdrom
      apt-cdrom -m add /media/cdrom
    SHELL
  end
  end 



end
