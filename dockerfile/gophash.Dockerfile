FROM allape/phash:3.16

ARG GO_NAME="go1.23.3.linux-amd64.tar.gz"

RUN apk update && apk add wget

WORKDIR /app

RUN wget "https://go.dev/dl/$GO_NAME" && tar -C /usr/local -xzf $GO_NAME

WORKDIR /app/pHash

RUN ln -s /app/pHash/bindings/go /usr/local/go/src/gophash
RUN cd /usr/local/go/src/gophash && /usr/local/go/bin/go install

# cd ..
# export docker_http_proxy=http://host.docker.internal:1080
# docker build --platform linux/amd64 -f dockerfile/gophash.Dockerfile --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy -t allape/gophash .

# test
# docker run --rm allape/gophash /usr/local/go/bin/go test -v /usr/local/go/src/gophash
