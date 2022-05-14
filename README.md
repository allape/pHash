# pHash - http://www.phash.org

### ⚠️ `av_frame_alloc` may emit errors, not tested in Windows ⚠️

### What have I done with [the original repo](https://github.com/aetilius/pHash) on Ubuntu:focal as root
```bash
apt update
#apt install --fix-missing
#apt autoremove

apt install -y \
  git \
  autoconf automake \
  cmake build-essential

apt install -y \
  cimg-dev libpthread-stubs0-dev ffmpeg \
  libpng-dev libjpeg-dev libtiff-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libsndfile1-dev libsamplerate0-dev libmpg123-dev

official_version="pHash-0.9.6"

git clone "https://github.com/aetilius/pHash"

wget "http://www.phash.org/releases/$official_version.tar.gz"
tar -xvzf "$official_version.tar.gz"

cp "$official_version/configure.ac" "pHash/configure.ac"
cp "$official_version/Makefile.am" "pHash/Makefile.am"
cp -R "$official_version/m4" "pHash/m4"
```

### Modified Files, Base on [Official Repo](https://github.com/aetilius/pHash) and [Official Download](http://www.phash.org/releases/pHash-0.9.6.tar.gz)
- Modified
  - .gitignore
  - configure.ac
  - examples/Makefile.am
  - examples/Makefile.in
  - phash-win32/src/cimgffmpeg.cpp
  - src/Makefile.am
  - src/Makefile.in
- Migrated
  - configure.ac
  - Makefile.am
  - m4/ax_pthread.m4
- New
  - bindings/go/*
  - docker/*
  - README.md

### Installation on Ubuntu:focal with `aliyun` mirror
```bash
chmod +x ./docker/prepare.sh && ./docker/prepare.sh
chmod +x ./docker/install.sh && ./docker/install.sh

# test
./examples/test_mhimagehash pHash.png pHash.png
# distance should be 0
```

### Dockerize, details in [Dockerfile](./docker/Dockerfile)
```bash
cd docker
chmod +x ./build.sh
# http_proxy=http://0.0.0.0:1080 \
# git_proxy=http://0.0.0.0:1080 \
./build.sh
```

[Docker Hub](https://hub.docker.com/r/allape/phash)
