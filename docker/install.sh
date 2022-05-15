#!/bin/bash

cd pHash || exit 1

# generate header file
cmake -DWITH_AUDIO_HASH=1 -DWITH_VIDEO_HASH=1 .

# https://stackoverflow.com/questions/22603163/automake-error-ltmain-sh-not-found
# automake build
libtoolize --force

# FIXME building in docker will cause `libtoolize` putting `ltmain.sh` into parent folder
if [[ -n "${DOCKER_BUILDING}" ]]; then
  mv ../ltmain.sh ./
fi

aclocal
autoheader
autoconf
automake --add-missing
#autoreconf

# final build
./configure
make && make install

cd ..
