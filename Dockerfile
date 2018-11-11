from guacamole/guacd:latest
MAINTAINER Thomas Kent <docker@teeks99.com>

RUN yum install -y openssh-server \
 && sed -i '/PasswordAuthentication yes/d' /etc/ssh/sshd_config \
 && echo PasswordAuthentication no >> /etc/ssh/sshd_config 

EXPOSE 22

