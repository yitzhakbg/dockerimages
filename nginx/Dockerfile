FROM phusion/baseimage:0.9.16
MAINTAINER Yitzhak Bar Geva <yitzhakbargeva@gmail.com>


# install prerequisites
RUN apt-get update && apt-get install -y wget && \
    git && \
    build-essential && \
    libldap2-dev && \
    libssl-dev && \
    libpcre3-dev && \
    multiarch-support && \
    libdebconfclient0 && \
    libc6 && \
    awk

WORKDIR /work

# download needed sources

RUN wget http://nginx.org/download/nginx-1.9.0.tar.gz && tar -xzf nginx-1.9.0.tar.gz && rm nginx-1.9.0.tar.gz
RUN wget http://zlib.net/zlib-1.2.8.tar.gz && tar -xzf zlib-1.2.8.tar.gz && rm zlib-1.2.8.tar.gz
RUN wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre2-10.10.tar.gz && tar -xzf pcre2-10.10.tar.gz && rm pcre2-10.10.tar.gz
RUN wget https://www.openssl.org/source/openssl-1.0.2-latest.tar.gz && tar -xzf openssl-1.0.2-latest.tar.gz && rm openssl-1.0.2-latest.tar.gz
RUN git clone https://github.com/kvspb/nginx-auth-ldap.git

# configure and install nginx
ADD nginx.build.sh /work/
RUN useradd -M -U -s /usr/sbin/nologin nginx
RUN ./nginx.build.sh /work/nginx-1.9.0/
RUN mkdir /etc/nginx/sites-available /etc/nginx/sites-enabled
ADD default /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/

# expose default ports
EXPOSE 80
EXPOSE 443

# add custom configs
ONBUILD COPY * /tmpconfig/
ONBUILD RUN if [ -e /tmpconfig/nginx.* ]; then cp /tmpconfig/nginx.* /etc/nginx/sites-enabled/; rm /etc/nginx/sites-enabled/default; fi
ONBUILD RUN rm -rf /tmpconfig

# expose nginx config dir
VOLUME ["/etc/nginx/sites-enabled"]

# start
CMD ["/usr/sbin/nginx"]
