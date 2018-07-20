#!/bin/bash

# java
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list.d/webupd8team-java.list

# certbot
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 75BCA694
echo "deb http://ppa.launchpad.net/certbot/certbot/ubuntu xenial main" > /etc/apt/sources.list.d/certbot.list

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# mongo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv A15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.4.list

# unifi
apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
#apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > /etc/apt/sources.list.d/ubnt.list

apt-get update

apt-get install -y --no-install-recommends wget haveged certbot oracle-java8-installer mongodb-org
systemctl start mongod
systemctl enable mongod

systemctl start haveged
systemctl enable haveged

UNIFI_VERSION=5.8.24
wget https://www.ubnt.com/downloads/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb
dpkg --install unifi_sysvinit_all.deb
apt-get install -f -y
apt autoremove
rm -f unifi_sysvinit_all.deb

systemctl enable unifi
