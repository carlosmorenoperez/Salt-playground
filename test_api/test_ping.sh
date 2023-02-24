#!/bin/bash
curl -sSk https://localhost:8000 \
    -H 'Accept: application/x-yaml' \
    -H 'X-Auth-Token: '\
    -d client=local \
    -d tgt='*' \
    -d fun=test.ping
