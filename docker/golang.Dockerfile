FROM allape/phash

ARG GO_NAME="go1.23.2.linux-amd64.tar.gz"

RUN apk update && apk add wget webp ffmpeg

WORKDIR /app

RUN wget "https://go.dev/dl/$GO_NAME" && tar -C /usr/local -xzf $GO_NAME

WORKDIR /app/pHash

RUN ln -s /app/pHash/bindings/go /usr/local/go/src/gophash
RUN cd /usr/local/go/src/gophash && /usr/local/go/bin/go install
