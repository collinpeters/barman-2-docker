FROM debian:jessie

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# Install Barman
RUN apt-get update \
	&& apt-get install -y barman \
	&& rm -rf /var/lib/apt/lists/*

ADD barman.conf /etc/barman.conf
ADD barman.d /etc/barman.d/
ADD pgpass /var/lib/barman/.pgpass
RUN chmod 600 /var/lib/barman/.pgpass
RUN chown barman:barman /var/lib/barman/.pgpass
