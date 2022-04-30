#!/bin/bash

cd pHash || exit 1

# these commands will throw some missing errors
autoreconf
automake --add-missing
autoreconf
automake

# generate header file
cmake configure .
cmake .
make clean

# this time will throw version mismatch
./configure --enable-video-hash=no
make

# make version match
aclocal && libtoolize --force && autoconf
automake --add-missing
autoreconf

# final build
./configure --enable-video-hash=no
make && make install

cd ..
