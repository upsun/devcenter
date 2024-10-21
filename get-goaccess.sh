#!/usr/bin/env bash

GO_ACCESS_VERSION=1.9.3

if [ ! -f goaccess-$GO_ACCESS_VERSION.tar.gz ]; then
    echo "File not found!"
else
    rm goaccess-$GO_ACCESS_VERSION.tar.gz
fi

wget https://tar.goaccess.io/goaccess-$GO_ACCESS_VERSION.tar.gz
tar -xzvf goaccess-$GO_ACCESS_VERSION.tar.gz
mv goaccess-$GO_ACCESS_VERSION goaccess

cd goaccess
./configure --enable-utf8 --enable-geoip=mmdb
make
make install

# $ cd goaccess-1.9.3/
# $ ./configure --enable-utf8 --enable-geoip=mmdb
# $ make
# # make install