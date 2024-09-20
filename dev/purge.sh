#!/usr/bin/env bash

FASTLY_SERVICE_ID=$(echo $PLATFORM_VARIABLES | base64 --decode | jq -r '.FASTLY_API_SERVICE')
FASTLY_API_TOKEN=$(echo $PLATFORM_VARIABLES | base64 --decode | jq -r '.FASTLY_API_TOKEN')
if [ ! -z "$FASTLY_API_TOKEN" ]; then
    echo "Clearing Fastly cache"
    curl -i -X POST "https://api.fastly.com/service/$FASTLY_SERVICE_ID/purge_all" -H "Fastly-Key: ${FASTLY_API_TOKEN}" -H "Accept: application/json"
fi
