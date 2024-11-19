#!/usr/bin/env bash

rm -rf env
python3 -m venv env
source env/bin/activate
pip install --upgrade pip
# ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
# pip-audit 2.7.3 requires cyclonedx-python-lib<8,>=5, but you have cyclonedx-python-lib 8.5.0 which is incompatible.
pip install "cyclonedx-python-lib<8"
pip install -r requirements.txt
pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U
pip install "cyclonedx-python-lib<8"
pip freeze > requirements.txt
pip install -r requirements.txt
pip-audit -r requirements.txt

cd dev
npm upgrade
npm audit
