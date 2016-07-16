#!/bin/bash
set -e
source /nd_build/buildconfig

header "Finalizing..."

run apt-get remove -y autoconf automake
run apt-get autoremove
run apt-get clean
run rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
run rm -rf /nd_build
