FROM ubuntu:focal

WORKDIR /app

# prevent `ztdata` prompt an user interactive dialog
ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_PROXY=""
ENV git_proxy=$GIT_PROXY

COPY prepare.sh .
RUN chmod +x ./prepare.sh && ./prepare.sh

COPY download.sh .
RUN chmod +x ./download.sh && ./download.sh

WORKDIR pHash
COPY install.sh docker-install.sh
RUN chmod +x ./docker-install.sh && ./docker-install.sh

WORKDIR /app

CMD ["./pHash/examples/test_mhimagehash", "./pHash/pHash.png", "./pHash/pHash.png"]
