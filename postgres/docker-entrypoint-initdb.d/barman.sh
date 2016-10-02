#!/bin/bash
set -e

echo "Adding Barman users..."

# Create barman users
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER barman SUPERUSER PASSWORD '$BARMAN_PASSWORD';
    CREATE USER streaming_barman REPLICATION PASSWORD '$BARMAN_STREAMING_PASSWORD';
EOSQL
