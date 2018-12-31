Vagrant.configure("2") do |config|
#  config.vbguest.installer = CustomInstaller
  config.vm.define :ui do |ui|
    ui.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.name = "ui"
      vb.cpus = "2"
    end
    ui.vm.box = "ubuntu/trusty64"
    ui.vm.hostname = "ui"
    ui.vm.network "private_network", ip: "192.168.50.4"
  end

  config.vm.define :server do |server|
    server.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.name = "ui"
      vb.cpus = "2"
    end
    server.vm.box = "ubuntu/trusty64"
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "192.168.50.5"
  end
  config.vm.synced_folder "synced_folder/", "/synced_folder"
  config.vm.provision "shell", path: "bootstrap.sh"
end
