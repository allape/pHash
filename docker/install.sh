#!/bin/bash

cd pHash || exit 1

# generate header file
cmake configure .
cmake .
make clean

# make version match
aclocal && libtoolize --force && autoconf
automake --add-missing
autoreconf

# final build
./configure --enable-video-hash=no
make && make install

cd ..
