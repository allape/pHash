# pHash - http://www.phash.org

[Docker Hub](https://hub.docker.com/r/allape/phash)

### Build on Alpine

```shell
apk update
apk add build-base cmake git autoconf automake libtool
apk add cimg libpng-dev libjpeg-turbo-dev tiff-dev

cmake .
libtoolize --force
aclocal
autoheader
autoconf
automake --add-missing
./configure --enable-video-hash=no --enable-audio-hash=no
make && make install
```
