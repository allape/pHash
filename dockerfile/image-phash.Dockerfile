FROM alpine:3.15

WORKDIR /app

RUN apk update && apk add build-base cmake git autoconf automake libtool
RUN apk add libpng-dev libjpeg-turbo-dev tiff-dev

#RUN test -n "$http_proxy" && git config --global http.proxy $http_proxy || exit 0
#RUN test -n "$https_proxy" && git config --global https.proxy $https_proxy || exit 0
#RUN git clone --depth=1 https://github.com/allape/pHash.git
#RUN git config --global --unset http.proxy && git config --global --unset https.proxy || exit 0

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
#RUN ldconfig

# export docker_http_proxy=http://ip:1080
# cd ..
# docker build -f dockerfile/image-phash.Dockerfile --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy --progress plain -t allape/phash .
