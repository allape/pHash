#!/bin/bash

cd pHash || exit 1

# generate header file
cmake configure .
cmake -DWITH_AUDIO_HASH=1 -DWITH_VIDEO_HASH=1 .

# make version match
aclocal && libtoolize --force && autoconf
automake --add-missing
autoreconf

# final build
./configure
make && make install

cd ..
