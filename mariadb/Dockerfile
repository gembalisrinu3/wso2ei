# Operation system
FROM ubuntu:18.04

# ssh Install
FROM sv00360113/ssh

# Maintainer
MAINTAINER  Srinivas <srinivas@email.com>

# Install packages.
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

#install Important packages
RUN apt-get update && apt-get -y install apt-transport-https curl aufs-tools automake sshpass vim libtool hostname supervisor ufw iputils-ping telnet wget --fix-missing && \
    apt-get update && \
    apt-get -y install  ca-certificates gnupg-agent software-properties-common && \
    apt-get install -y sudo && \
    apt-get install -y build-essential && \
    apt-get install -y nano && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils

#ssh
RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

# Install Mariadb 
RUN apt-get install software-properties-common -y
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN add-apt-repository 'deb [arch=amd64,arm64,i386,ppc64el] http://mirror.rackspace.com/mariadb/repo/10.3/ubuntu xenial main'
RUN apt-get update && apt-get upgrade -y
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password password regadmin'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password_again password regadmin'"]
RUN apt-get -y install mariadb-server-10.3
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
#EXPOSE 3306
#RUN mkdir /var/run/mysqld/
RUN touch /var/run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306
#ADD ./ssh.sh /tmp/ssh.sh
#RUN chmod 777 /tmp/ssh.sh
CMD ["mysqld"]

