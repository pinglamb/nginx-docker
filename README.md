# Docker base image for Nginx base on https://github.com/phusion/passenger-docker

Passenger-docker is really cool for deploying Rails app with passenger.

This project extracts the perfect user/nginx config from passenger-docker but omits the installation of passenger.

It is for deploying Rails app with other web server option likes puma (Rails 5 default) but at the same time having nginx to serve static assets.

See [https://github.com/phusion/passenger-docker](https://github.com/phusion/passenger-docker) for details.
