#! /bin/bash
# Script to install Jenkins 
<<ml
     Hige level Steps
     1) create nexus User & give admin rights
     2) install depedndencies - wget, java jdk, unzip
     3) download nexus
     4) change ownership & group to nexus and set permission to 775 
     5) start nexus => systemctl start nexus
ml


# Step 0: Set Hostname
sudo hostnamectl set-hostname nexus

# Step 1: Create Nexus User
sudo useradd nexus
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
su - nexus

# Step 2: cd to /opt install dependencies wget, unzip
cd /opt
sudo yum install wget unzip -y

# Step 3: Install Java jdk
sudo wget sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install jdk-8u131-linux-x64.rpm -y

# Step 4: Download Sonar & unzip & Rename
sudo wget sudo wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz 
sudo tar -zxvf nexus-3.15.2-01-unix.tar.gz
sudo rm -rf nexus-3.15.2-01-unix.tar.gz
sudo mv /opt/nexus-3.15.2-01 /opt/nexus

# Step 5: Set ownership, group & permission for Nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work
echo "run_as_user='nexus'" > /opt/nexus/bin/nexus.rc

# Step 6: nexus service
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus

# Step 6: Start SonarQube
sudo sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start