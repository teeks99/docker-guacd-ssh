from guacamole/guacd:latest
MAINTAINER Thomas Kent <docker@teeks99.com>

RUN apt-get update \
 && apt-get install -y \
  openssh-server \
 && echo PasswordAuthentication no >> sshd_config 

EXPOSE 22

