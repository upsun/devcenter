#!/usr/bin/env bash

if [ ! -z "$HUGO_ENVIRONMENT" ]; then
    if [ "$HUGO_ENVIRONMENT" = "production" ]; then
        nix-shell prod.nix
    fi
else
    echo "HUGO_ENVIRONMENT is not set. Running in development mode."
    export HUGO_ENVIRONMENT=development
    nix-shell dev.nix
fi
