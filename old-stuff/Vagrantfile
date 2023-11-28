Vagrant.configure("2") do |config|
  # config.vm.define "ansible-test"
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.memory = 4096
  end
  # with a private IP I can use mDNS to do the rest
  config.vm.network "private_network", ip: "192.168.3.3"
  # config.vm.hostname = "ansible-test"

  config.vm.provision "shell", inline: "apt update && apt install ubuntu-desktop"
end
