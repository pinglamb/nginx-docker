#!/bin/bash
set -e
source /nd_build/buildconfig

RUBY_VERSION=2.4.2
RUBY_GEM_VERSION=2.6.13
RUBY_INSTALL_VERSION=0.6.1
BUNDLER_VERSION=1.15.4
TZINFO_VERSION=1.2017.2

header "Installing Ruby..."

# skip installing gem documentation
run mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

run true && curl -L https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz | tar xzv
run cd ruby-install-$RUBY_INSTALL_VERSION && make install
run cd .. && rm -r ruby-install-$RUBY_INSTALL_VERSION

run ruby-install --system ruby $RUBY_VERSION -- --disable-install-doc
run gem update --system $RUBY_GEM_VERSION
run gem install bundler -v $BUNDLER_VERSION
run gem install tzinfo-data -v $TZINFO_VERSION
