#!/bin/bash

set -e

echo "Starting Salt Master ..."


if [ ! -f "/etc/salt/certs" ]; then

  mkdir -p /etc/salt/certs

fi

# Start the Salt Master
/usr/bin/salt-master --log-file-level=debug &

if [ ! -f "/etc/salt/certslocalhost.crt" ]; then

  /usr/bin/salt-run salt.cmd tls.create_self_signed_cert

fi

# Rights

if [ -f "/var/run/salt" ]; then

   chmod -R 775 /var/run/salt

fi

if [ -f "/etc/salt/certs" ]; then

   chmod -R 775 /etc/pki

fi

# Start the Salt API
echo "Starting Salt API..."

/usr/bin/salt-api --log-file-level=debug &

# Keep the container running
while true; do sleep 1000; done