#!/usr/bin/env bash

# Setup
cd dev
rm -rf public
hugo

# Lint markdown
npm run lint:markdown

# Lint prose
# @todo: https://vale.sh/docs/vale-cli/installation/#docker
vale content
