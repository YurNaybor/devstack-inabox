FROM debian:stretch-slim

RUN apt-get update \
	&& apt-get -y install git apache2 \
	&& apt-get clean \
	&& rm -f -v -r /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN mkdir /var/www/html/openstack

COPY populate.sh /var/www/html/openstack/

WORKDIR /var/www/html/openstack

RUN bash populate.sh

CMD service apache2 start && tail -F /var/log/apache2/*.log
