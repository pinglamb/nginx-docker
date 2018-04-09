#!/bin/bash
set -e
source /nd_build/buildconfig

RUBY_VERSION=2.5.1
RUBY_GEM_VERSION=2.7.6
RUBY_INSTALL_VERSION=0.6.1
BUNDLER_VERSION=1.16.1
TZINFO_VERSION=1.2018.4
JOBS=4

header "Installing Ruby..."

# skip installing gem documentation
run mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

run curl -L https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz | tar xzv
run make -C ruby-install-$RUBY_INSTALL_VERSION install
run rm -r ruby-install-$RUBY_INSTALL_VERSION

run ruby-install --jobs=$JOBS --system ruby $RUBY_VERSION -- --disable-install-doc
run gem update --system $RUBY_GEM_VERSION
run gem install bundler -v $BUNDLER_VERSION
run gem install tzinfo-data -v $TZINFO_VERSION
