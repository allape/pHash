#!/bin/bash

# This script should be run in `pHash` root folder

# `cd` can NOT be used in script, or `libtoolize` will misbehave
#cd pHash || exit 1

# generate header file
cmake -DWITH_AUDIO_HASH=1 -DWITH_VIDEO_HASH=1 .

# https://stackoverflow.com/questions/22603163/automake-error-ltmain-sh-not-found
# automake build
libtoolize --force
aclocal
autoheader
autoconf
automake --add-missing
#autoreconf

# final build
./configure
make && make install
