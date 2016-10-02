#!/bin/bash

set -e

# build database
docker build -t postgres-with-barman:9.6 .

# start database
docker run --name postgres-barman -e POSTGRES_PASSWORD=password -e BARMAN_PASSWORD=password -e BARMAN_STREAMING_PASSWORD=password -d postgres-with-barman:9.6
