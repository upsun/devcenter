#!/usr/bin/env bash

# Check pip
rm -rf env
python3 -m venv env
source env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
pip-audit -r requirements.txt

# Check NPM
cd dev
npm audit
