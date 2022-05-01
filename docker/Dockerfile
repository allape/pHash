FROM ubuntu:focal

WORKDIR /app

# prevent `ztdata` prompt an user interactive dialog
ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_PROXY=""
ENV git_proxy=$GIT_PROXY

RUN echo 'APT::Acquire::Retries "9999";' > /etc/apt/apt.conf.d/80-retries

# change archive host to `aliyun` due to poor connection with `archive.ubuntu.com`
RUN { \
      echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse"; \
      echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse"; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse"; \
      echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse"; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse"; \
      echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse"; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse"; \
      echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse"; \
    } > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
      git \
      autoconf \
      automake \
      build-essential \
      cmake \
      cimg-dev libpthread-stubs0-dev ffmpeg \
      libpng-dev libjpeg-dev libtiff-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libsndfile1-dev libsamplerate0-dev libmpg123-dev

RUN git config --global http.proxy $git_proxy && \
    git config --global https.proxy $git_proxy
RUN git clone --depth 1 "https://github.com/allape/pHash.git"
RUN git config --global --unset http.proxy && \
    git config --global --unset https.proxy

ADD install.sh ./
RUN chmod +x ./install.sh && ./install.sh

CMD ["./pHash/examples/test_mhimagehash"]
