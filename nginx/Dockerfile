FROM phusion/baseimage:0.9.16

MAINTAINER Yitzhak Bar Geva <yitzhakbargeva@gmail.com>

ENV NGINX_VERSION 1.9.0-1~trusty
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN curl -sS http://nginx.org/keys/nginx_signing.key | sudo apt-key add - && \
    echo 'deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx' >> /etc/apt/sources.list && \
    echo 'deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx' >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

