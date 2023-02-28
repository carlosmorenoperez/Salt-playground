#!/bin/bash
curl -sSk https://localhost:8000 \
    -H 'Accept: application/x-yaml' \
    -H 'X-Auth-Token: 29896f3a9b06ce4971330868b8876c64dbdad88f'\
    -d client=local \
    -d tgt='infra01' \
    -d fun=grains.items
