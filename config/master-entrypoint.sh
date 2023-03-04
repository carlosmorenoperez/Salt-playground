#!/bin/bash

set -e

if [ ! -f "/etc/salt/certs" ]; then

  mkdir -p /etc/salt/certs

fi

if [ ! -f "/etc/salt/certs/tls/certs/localhost.crt" ]; then

  /usr/bin/salt-run salt.cmd tls.create_self_signed_cert

fi

if [ ! -f "/etc/salt/cloud.deploy.d/bootstrap-salt.sh" ]; then

  /usr/bin/salt-cloud -u

fi

# Rights

if [ -f "/var/run/salt" ]; then

   chmod -R 775 /var/run/salt

fi


if [ -f "/etc/salt/certs" ]; then

   chmod -R 775 /etc/salt/certs

fi

# Start the Salt Master
echo "Starting Salt Master ..."

/usr/bin/salt-master --log-file-level=debug &

# Start the Salt API
echo "Starting Salt API..."

/usr/bin/salt-api --log-file-level=debug &

# Keep the container running
while true; do sleep 1000; done