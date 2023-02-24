#!/bin/bash
curl -sSk https://localhost:8000/login \
    -H 'Accept: application/x-yaml' \
    -d username=salt \
    -d password=CloruroSodico \
    -d eauth=pam
