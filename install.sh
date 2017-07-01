#!/bin/bash
set -e
source /nd_build/buildconfig

run /nd_build/enable_repos.sh
run /nd_build/prepare.sh
run /nd_build/utilities.sh

run /nd_build/nginx.sh
run /nd_build/ruby-2.4.sh

run /nd_build/finalize.sh
