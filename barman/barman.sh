#!/bin/sh

# build barman image
docker build -t barman .

# run & drop at console
docker run -it --rm --link postgres-barman:postgres barman /bin/bash

# Remaining commands run inside barman

# Create replication slot
barman receive-wal --create-slot testdb

# Start cron
barman cron

# Check
barman check testdb

# WAL archive: FAILED (please make sure WAL shipping is setup)
# :(
