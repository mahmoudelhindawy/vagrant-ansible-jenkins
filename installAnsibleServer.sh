#install ansible
sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get -y install ansible

#create ansible user
sudo useradd  -m -d /home/ansible -s /bin/bash ansible

#add ansible user to sudoers with no password
echo 'ansible	ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'ansible	ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'jenkins	ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# create pub and private key for ansible user
#sudo -i
#su - ansible
#ssh-keygen -t rsa -N "" -f my.key
#sudo cat /home/ansible/.ssh/id_rsa.pub >> /home/vagrant/authorizedkeys/authorized_keys
sudo mkdir /home/ansible/.ssh
sudo cp /home/vagrant/sharedWithServer/* /home/ansible/.ssh/
#configure ansible hosts file
echo '[webservers]' >> /etc/ansible/hosts
echo 'host1	ansible_ssh_host=192.168.33.11' >> /etc/ansible/hosts

sudo sed -i '/\[defaults\]/ahost_key_checking = False' /etc/ansible/ansible.cfg
