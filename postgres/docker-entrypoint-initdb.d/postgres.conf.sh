#!/bin/bash

PG_DATA=/var/lib/postgresql/data

echo "Updating postgres.conf for Barman access..."

sed -i -e"s/^#wal_level.*$/wal_level = replica/" ${PG_DATA}/postgresql.conf
sed -i -e"s/^#max_wal_senders.*$/max_wal_senders = 3/" ${PG_DATA}/postgresql.conf
sed -i -e"s/^#max_replication_slots.*$/max_replication_slots = 2/" ${PG_DATA}/postgresql.conf
sed -i -e"s/^#synchronous_standby_names.*$/synchronous_standby_names = 'barman_receive_wal'/" ${PG_DATA}/postgresql.conf

echo "Updating pg_hba.conf for streaming replication access by Barman..."
echo "host	replication	streaming_barman	172.17.0.0/28	trust" >> ${PG_DATA}/pg_hba.conf
echo "host	replication	streaming_barman	172.17.1.0/28	trust" >> ${PG_DATA}/pg_hba.conf
