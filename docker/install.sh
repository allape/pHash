#!/bin/bash

cd pHash || exit 1
autoreconf
aclocal && libtoolize --force && automake --add-missing && autoreconf
automake
./configure --enable-video-hash=no
make && make install
cd ..
