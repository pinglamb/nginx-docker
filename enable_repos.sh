#!/bin/bash
set -e
source /nd_build/buildconfig

header "Preparing APT repositories"

## Nginx Stable
run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
echo "+ Enabling Nginx APT repo"
echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" > /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/ubuntu/ xenial nginx" > /etc/apt/sources.list.d/nginx.list

run apt-get update
