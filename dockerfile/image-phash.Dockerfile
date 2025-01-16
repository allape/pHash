FROM alpine:3.16

# alpine:3.17 and above,
# `docker run --rm allape/phash:3.17 /app/pHash/examples/test_printimagehash /app/pHash/pHash.png`
# will print
# 0000013f89c1e3920400fe233b9e303fe2e325471dd95119f2a552b2dc550ab4b16ad96d60acef67151c39c4ab2068f70ce7323dc0db012492f27278380cdbb2dac7edc4bdaf6cdb

# alpine:3.16 and below
# the same command will print
# 000002ff89c1e392350d7e233b9e302fe2e356471dd95119f2a552b2dc550ab4b16ad96df0acef67151c39c4af4460f70ce7323db90002db12f2727c382c04b2dac7edc4bdaf6c92

# The minimal version for VS Code dev container is alpine:3.16 and above,

WORKDIR /app

RUN apk update && apk add build-base cmake git autoconf automake libtool
RUN apk add libpng-dev libjpeg-turbo-dev tiff-dev

WORKDIR /app/pHash

COPY . .

RUN cmake .
RUN cp ./third-party/CImg/CImg.h /usr/include/CImg.h
RUN libtoolize --force && \
    aclocal && \
    autoheader && \
    autoconf && \
    automake --add-missing && \
    ./configure --enable-video-hash=no --enable-audio-hash=no
RUN make && make install

### build ###
# cd ..
# export docker_http_proxy=http://ip:1080
# #amd64
# docker build --platform linux/amd64 -f dockerfile/image-phash.Dockerfile --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy -t allape/phash:alpine-3.16 .
# #arm64
# docker build --platform linux/arm64 -f dockerfile/image-phash.Dockerfile --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy -t allape/phash:alpine-3.16 .

### test  ###
# docker run --rm allape/phash:alpine-3.16 /app/pHash/examples/test_printimagehash /app/pHash/pHash.png
