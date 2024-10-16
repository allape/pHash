FROM allape/phash

ARG GO_NAME="go1.23.2.linux-amd64.tar.gz"

RUN apk update && apk add wget

WORKDIR /app

RUN wget "https://go.dev/dl/$GO_NAME" && tar -C /usr/local -xzf $GO_NAME

WORKDIR /app/pHash

RUN ln -s /app/pHash/bindings/go /usr/local/go/src/gophash
RUN cd /usr/local/go/src/gophash && /usr/local/go/bin/go install

# export docker_http_proxy=http://ip:1080
# cd ..
# docker build -f dockerfile/gophash.Dockerfile --build-arg http_proxy=$docker_http_proxy --build-arg https_proxy=$docker_http_proxy --progress plain -t allape/gophash .

# test
# docker run --rm allape/gophash /usr/local/go/bin/go test -v /usr/local/go/src/gophash
