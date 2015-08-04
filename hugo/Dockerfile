FROM phusion/baseimage:0.9.17
MAINTAINER Yitzhak Bar Geva <yitzhakbargeva@gmail.com>

#install utilities
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
  && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get hugo
ADD https://github.com/spf13/hugo/releases/download/v0.14/hugo_0.14_linux_amd64.tar.gz .
RUN tar zxf hugo_0.14_linux_amd64.tar.gz -C /opt/ && \
    rm hugo_0.14_linux_amd64.tar.gz

#create link to hugo in /usr/local/bin
RUN ln -s /opt/hugo_0.14_linux_amd64/hugo_0.14_linux_amd64 /usr/local/bin/hugo

#expose default hugo server port
EXPOSE 1313

#create dummy site directory and set as working dir
RUN mkdir /site

WORKDIR /site

#when used as a base image add the current folder to /site folder (workdir)
ONBUILD ADD . /site

#configure entrypoint
ADD docker_entrypoint.sh /

ENTRYPOINT ["/docker_entrypoint.sh"]
