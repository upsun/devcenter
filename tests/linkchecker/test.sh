#!/usr/bin/env bash

rm -rf tests/linkchecker/xml2md

git clone https://github.com/platformsh/linkchecker-xml2md.git tests/linkchecker/xml2md

cd tests/linkchecker/xml2md

python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
pip install linkchecker
pip list

# @todo: doesn't work (only 1 link checked) for localhost.
scanURL=$1

linkchecker $scanURL -F xml/utf_8/brokenlinks.xml \
    --check-extern --no-warnings \
    --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36" \
    --ignore-url="^https://github.com/platformsh*" \
    --ignore-url="console.platform.sh/projects/*" \
    --ignore-url="support.platform.sh/*" \
    --ignore-url="community.platform.sh/*" \
    --ignore-url="https://api.example.com" \
    --ignore-url="support.blackfire.io/*" \
    --ignore-url="cloud.orange-business.com/*" \
    --ignore-url="developers.cloudflare.com/*" \
    --ignore-url="discord.com/*" \
    --ignore-url="https://media.licdn.com/*" \
    --ignore-url="pptr.dev/*" \
    --ignore-url="mvnrepository.com/*" \
    --ignore-url="https://dev.mysql.com/doc/refman/en/" \
    --ignore-url="https://www.microsoft.com/en-us/trust-center/privacy/data-management"
