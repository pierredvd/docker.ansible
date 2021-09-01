FROM debian:buster-slim
ENV  DEBIAN_FRONTEND noninteractive
#EXPOSE 80
RUN 	apt-get upgrade -y
RUN 	apt-get install dpkg -y
RUN 	apt install -f
RUN 	dpkg --configure -a
RUN 	apt-get update

# Utilities
RUN 	apt-get install apt-utils -y
RUN 	apt-get install sudo -y
RUN 	apt-get install software-properties-common -y
RUN 	apt-get install wget -y
RUN 	apt-get install vim nano -y
RUN 	apt-get install apt-transport-https -y
RUN 	apt-get install lsb-release -y
RUN 	apt-get install ca-certificates -y
RUN 	apt-get install grep -y

# Install ansible
RUN     apt-get install ansible -y

# VOLUME
RUN     mkdir /etc/ansible/inventory
RUN     chmod -R 2775 /etc/ansible/inventory

# CLEAN UP APT AND TEMPORARIES
RUN   	apt-get clean
RUN   	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# VOLUME
VOLUME 	["/etc/ansible/inventory"]

# WORKDIR
WORKDIR /etc/ansible/inventory

# BOOTLOAD
COPY 	./config/init.sh /usr/sbin/init.sh
RUN  	chmod 0775 /usr/sbin/init.sh
CMD  	/usr/sbin/init.sh && /bin/bash
