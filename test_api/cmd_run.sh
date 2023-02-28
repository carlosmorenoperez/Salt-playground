#!/bin/bash
curl -sSk https://localhost:8000/run \
    -H 'Accept: application/x-yaml' \
    -H 'X-Auth-Token: 8cdbc542ec002981733df86de5dbebee82127bfc'\
    -d '[{
        "client": "local",
        "tgt": "infra01",
        "fun": "cmd.run",
        "kwarg": {"cmd": "df -h"},
       }]'
