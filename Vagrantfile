Vagrant.configure("2") do |config|

  config.vm.define "ansibleJenServer" do |ansibleJenServer|
    ansibleJenServer.vm.box = "ubuntu/trusty64"
    ansibleJenServer.vm.network "forwarded_port", guest: 8080, host: 8080
    ansibleJenServer.vm.network "private_network", ip: "192.168.33.10"

    ansibleJenServer.vm.provider "virtualbox" do |vb|
      vb.name = "ansibleJenServer"
      vb.memory = "1024"
    end

    ansibleJenServer.vm.provision "shell", path: "installJenkins.sh"
    ansibleJenServer.vm.provision "shell", path: "installAnsibleServer.sh"

    ansibleJenServer.vm.synced_folder "./shared/jenkins", "/var/lib/jenkins", :mount_options => ["dmode=777", "fmode=777"]
    ansibleJenServer.vm.synced_folder "./shared/sharedWithServer", "/home/vagrant/sharedWithServer", :mount_options => ["dmode=777", "fmode=777"]
  end

  config.vm.define "ansibleCleint" do |ansibleCleint|
    ansibleCleint.vm.box = "ubuntu/trusty64"
    ansibleCleint.vm.network "forwarded_port", guest: 8080, host: 8090
    ansibleCleint.vm.network "private_network", ip: "192.168.33.11"
    ansibleCleint.vm.provider "virtualbox" do |vb|
      vb.name = "ansibleCleint"
      vb.memory = "1024"
      vb.cpus = 1 
    end
    ansibleCleint.vm.provision "shell", path: "installAnsibleCleint.sh"    
    ansibleCleint.vm.provision "shell", path: "installDockerCompose.sh"
    ansibleCleint.vm.synced_folder "./shared/sharedWithCleint", "/home/vagrant/sharedWithCleint", :mount_options => ["dmode=777", "fmode=777"]
  end
end
