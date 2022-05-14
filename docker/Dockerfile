FROM ubuntu:focal

WORKDIR /app

# prevent `ztdata` prompt an user interactive dialog
ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_PROXY=""
ENV git_proxy=$GIT_PROXY

ADD prepare.sh ./
RUN chmod +x ./prepare.sh && ./prepare.sh

ADD install.sh ./
RUN chmod +x ./install.sh && ./install.sh

CMD ["./pHash/examples/test_mhimagehash"]
