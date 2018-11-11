# docker-guacd-ssh
A docker image for guacd that allows SSH connections to mount VNC sessions

You can use this image with docker [similar to the docs](https://guacamole.apache.org/doc/gug/guacamole-docker.html), except adding a ssh port number and adding a ssh config with the crucial `authorized_keys` file:

    docker run --name some-guacd -d -p 4922:22 -v /host/ssh/config_dir:/root/.ssh teeks99/guacd-ssh:latest

Once the guacd docker instance is running, you can connect the guacamole instance to it, [like normal](https://guacamole.apache.org/doc/gug/guacamole-docker.html#guacamole-docker-guacd).

    docker run --name some-guacamole --link some-guacd:guacd -d -p 8080:8080 guacamole/guacamole:latest

Once all the guacamole infrastructure is up, you can now add a connection from your machine into the guacd instance over a ssh reverse tunnel.  This assume's the ssh public key is already in the `authorized_keys` files on guacd.

    autossh -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -R 5811:localhost:5801 root@hostname -p 4922

Finally, you can connect to the remote VNC session, as:

    localhost:5811
