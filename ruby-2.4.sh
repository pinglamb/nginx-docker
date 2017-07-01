#!/bin/bash
set -e
source /nd_build/buildconfig

header "Installing Ruby..."

# skip installing gem documentation
run mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

run curl -L -o ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
run tar -xzvf ruby-install-0.6.1.tar.gz
run rm ruby-install-0.6.1.tar.gz
run cd ruby-install-0.6.1
run make install
run cd .. && rm -r ruby-install-0.6.1

run ruby-install --system ruby 2.4.1 -- --disable-install-doc
run gem update --system 2.6.12
run gem install bundler -v 1.15.1

run gem install tzinfo-data -v 1.2017.2
