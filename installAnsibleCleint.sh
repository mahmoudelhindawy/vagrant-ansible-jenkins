#install ansible
sudo apt-get update
#sudo apt-get -y install software-properties-common
#sudo apt-add-repository ppa:ansible/ansible -y
#sudo apt-get update
#sudo apt-get -y install ansible


sudo apt-get -y install python

#create ansible user
sudo useradd  -m -d /home/ansible -s /bin/bash ansible

sudo mkdir /home/ansible/.ssh
sudo cat /home/vagrant/sharedWithCleint/authorized_keys >> /home/ansible/.ssh/authorized_keys

#add ansible user to sudoers with no password
echo 'ansible	ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'ansible	ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

