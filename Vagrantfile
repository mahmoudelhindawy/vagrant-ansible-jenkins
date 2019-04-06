# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
 

  config.vm.define "ansibleJenServer" do |ansibleJenServer|
    ansibleJenServer.vm.box = "ubuntu/trusty64"
    ansibleJenServer.vm.network "forwarded_port", guest: 8080, host: 8080
    ansibleJenServer.vm.network "private_network", ip: "192.168.33.10"

    ansibleJenServer.vm.provider "virtualbox" do |vb|
      vb.name = "ansibleJenServer"
      vb.memory = "4048"
      vb.cpus = 2
      #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      #vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    ansibleJenServer.vm.provision "shell", path: "installJenkins.sh"
    ansibleJenServer.vm.provision "shell", path: "installAnsibleServer.sh"

    ansibleJenServer.vm.synced_folder "./shared/jenkins", "/var/lib/jenkins", :mount_options => ["dmode=777", "fmode=666"]
    ansibleJenServer.vm.synced_folder "./shared/sharedWithServer", "/home/vagrant/sharedWithServer", :mount_options => ["dmode=777", "fmode=666"]
    #ansibleJenServer.vm.synced_folder "./shared/cleintAuthorizedKeys", "/home/vagrant/authorizedkeys", :mount_options => ["dmode=777", "fmode=666"]

  end

  config.vm.define "ansibleCleint" do |ansibleCleint|
    ansibleCleint.vm.box = "ubuntu/trusty64"
    ansibleCleint.vm.network "forwarded_port", guest: 8080, host: 8090
    ansibleCleint.vm.network "private_network", ip: "192.168.33.11"
    ansibleCleint.vm.provider "virtualbox" do |vb|
      vb.name = "ansibleCleint"
      vb.memory = "1024"
      vb.cpus = 1 

#      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    ansibleCleint.vm.provision "shell", path: "installAnsibleCleint.sh"    
    ansibleCleint.vm.synced_folder "./shared/sharedWithCleint", "/home/vagrant/sharedWithCleint", :mount_options => ["dmode=777", "fmode=666"]
    #ansibleCleint.vm.synced_folder "./shared/cleintAuthorizedKeys", "/home/ansible/.ssh/", :mount_options => ["dmode=777", "fmode=666"]

  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "./shared/jenkins", "/var/lib/jenkins", :mount_options => ["dmode=777", "fmode=666"]

  

end
