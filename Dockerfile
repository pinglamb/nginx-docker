FROM phusion/baseimage:0.9.19
MAINTAINER pinglamb <or@pinglamb.com>

ADD . /nd_build
RUN /nd_build/install.sh
CMD ["/sbin/my_init"]
EXPOSE 80 443
