#!/usr/bin/env bash

cd dev
rm -rf public
hugo
curl https://htmltest.wjdp.uk | bash

unset NO_COLOR
bin/htmltest
