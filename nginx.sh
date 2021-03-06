#!/bin/bash
set -e
source /nd_build/buildconfig
source /etc/environment

header "Installing Nginx..."

## Install Nginx
run apt-get install -y nginx nginx-extras

run cp /nd_build/config/nginx.conf /etc/nginx/nginx.conf
run mkdir -p /etc/nginx/main.d
run cp /nd_build/config/nginx_main_d_default.conf /etc/nginx/main.d/default.conf

## Install Nginx runit service.
run mkdir /etc/service/nginx
run cp /nd_build/runit/nginx /etc/service/nginx/run

run mkdir /etc/service/nginx-log-forwarder
run cp /nd_build/runit/nginx-log-forwarder /etc/service/nginx-log-forwarder/run

run sed -i 's|invoke-rc.d nginx rotate|sv 1 nginx|' /etc/logrotate.d/nginx
