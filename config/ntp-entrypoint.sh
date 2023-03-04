#!/bin/bash

set -e

echo "Starting Salt Minion"

# Start the Salt Master
/usr/bin/salt-minion --log-file-level=debug &
/usr/sbin/chronyd -d &

# Keep the container running
while true; do sleep 1000; done