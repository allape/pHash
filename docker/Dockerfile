FROM allape/phash_base:latest

WORKDIR /app

ARG GIT_PROXY=""
ENV git_proxy=$GIT_PROXY

COPY download.sh .
RUN chmod +x ./download.sh && ./download.sh

WORKDIR pHash
COPY install.sh docker-install.sh
RUN chmod +x ./docker-install.sh && ./docker-install.sh

CMD ["./pHash/examples/test_mhimagehash", "./pHash/pHash.png", "./pHash/pHash.png"]
