FROM ybarg/levpoem

MAINTAINER Yitzhak Bar Geva <yitzhakbargeva@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

VOLUME /var/www/$SITE
EXPOSE 22 2222 4444

# Instructions on the fusion-baseimage page: https://github.com/phusion/baseimage-docker
# Ehable the SSH server:
RUN rm -f /etc/service/sshd/down

# baseimage-docker does not contain SSH keys, but,
# The init system can Regenerate SSH host keys during boot:
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

## Install your own SSH key:
ADD your_key.pub /tmp/your_key.pub
RUN cat /tmp/your_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/your_key.pub



CMD ["sshd", "-q", "xx yy;"]
