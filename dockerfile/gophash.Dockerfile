FROM allape/phash:3.16

ARG GO_ARCH="amd64"
ARG GO_VERSION="1.23.3"
ARG GO_NAME="go$GO_VERSION.linux-$GO_ARCH.tar.gz"

RUN apk update && apk add wget

WORKDIR /app

RUN wget "https://go.dev/dl/$GO_NAME" && tar -C /usr/local -xzf $GO_NAME

WORKDIR /app/pHash

RUN ln -s /app/pHash/bindings/go /usr/local/go/src/gophash
RUN cd /usr/local/go/src/gophash && /usr/local/go/bin/go install

### build ###
# cd ..
# export docker_http_proxy=http://host.docker.internal:1080
# # amd64
# docker build --platform linux/amd64 -f dockerfile/gophash.Dockerfile --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy -t allape/gophash:alpine-3.16 .
# # arm64
# docker build --platform linux/arm64 -f dockerfile/gophash.Dockerfile --build-arg GO_ARCH=arm64 --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy -t allape/gophash:alpine-3.16 .

### test  ###
# docker run --rm allape/gophash:alpine-3.16 /usr/local/go/bin/go test -v /usr/local/go/src/gophash
