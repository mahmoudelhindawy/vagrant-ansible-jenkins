sudo -i
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo bash -c "echo deb http://http.debian.net/debian jessie-backports main >> /etc/apt/sources.list"
sudo bash -c "echo deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list"
sudo bash -c "echo deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
sudo apt-get -y upgrade

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selectionssudo 

sudo apt-get -y install oracle-java8-installer oracle-java8-set-default

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get -y install jenkins



#install git
sudo apt-get -y install git
#install maven
wget https://www-eu.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar -xf apache-maven-3.6.0-bin.tar.gz
sudo mv apache-maven-3.6.0 /opt/maven






