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
RUN apt-get update && apt-get -y install apt-transport-https curl sshpass aufs-tools automake vim libtool hostname supervisor ufw iputils-ping telnet wget --fix-missing && \
    apt-get update && \
    apt-get -y install  ca-certificates gnupg-agent software-properties-common && \
    apt-get install -y sudo && \
    apt-get install -y build-essential && \
    apt-get install -y nano && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils

#ssh 

RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

# Install WSO2-EI(Engerprise Integrator)
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "379CE192D401AB61"
RUN echo "deb https://dl.bintray.com/wso2/deb ei_640 release"  | \
tee -a /etc/apt/sources.list
RUN apt-get update && \
apt-get install wso2ei-6.4.0


# Download mysql-java-connector and copy to lib directory
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java_8.0.16-1ubuntu18.04_all.deb
RUN dpkg-deb -x mysql-connector-java_8.0.16-1ubuntu18.04_all.deb .
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/samples/axis2Client/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/repository/axis2/client/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/lib/
#RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/business-process/repository/deployment/server/webapps/bpmn/WEB-INF/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/tools/forget-me/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/broker/repository/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/analytics/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/analytics/wso2/tools/identity-anonymization-tool/lib/
RUN cp -r usr/share/java/mysql-connector-java-8.0.16.jar /usr/lib/wso2/wso2ei/6.4.0/wso2/analytics/wso2/lib/

# copy files

#ADD ./activiti-datasources.xml /usr/lib/wso2/wso2ei/6.4.0/wso2/business-process/conf/datasources/
#ADD ./bps-datasources.xml /usr/lib/wso2/wso2ei/6.4.0/wso2/business-process/conf/datasources/
#ADD ./master-datasources.xml /usr/lib/wso2/wso2ei/6.4.0/wso2/business-process/conf/datasources/

COPY ./wso2ei.sh /tmp/wso2ei.sh
COPY ./maraidb.sh /tmp/maraidb.sh
RUN chmod 777 /tmp/wso2ei.sh
EXPOSE 9445 

ADD ./ssh.sh /tmp/ssh.sh
RUN chmod 777 /tmp/ssh.sh
CMD sh /tmp/ssh.sh





