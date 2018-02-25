FROM phusion/baseimage:0.10.0
MAINTAINER pinglamb <or@pinglamb.com>

ADD . /nd_build
RUN /nd_build/install.sh
CMD ["/sbin/my_init"]
EXPOSE 80 443
