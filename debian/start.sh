#!/usr/bin/env bash

set -e

# Link with mongo
if [ ! -z "$MONGO_PORT_27017_TCP_ADDR" ]; then
  MONGO_URI="mongodb://${MONGO_PORT_27017_TCP_ADDR}:${MONGO_PORT_27017_TCP_PORT}/pritunl"
fi

# Set MONGO URI
if [ ! -z "$MONGO_URI" ]; then
  sed -i.bak -e "s,\"mongodb_uri\".*,\"mongodb_uri\": \"$MONGO_URI\"," /etc/pritunl.conf
fi

# Start
pritunl start
