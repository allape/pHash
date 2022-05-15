# pHash - http://www.phash.org

### ⚠️ `av_frame_alloc` in [`phash-win32/src/cimgffmpeg.cpp`](phash-win32/src/cimgffmpeg.cpp) may emit errors, not tested in Windows ⚠️

### Modified Files, Base on [Official Repo](https://github.com/aetilius/pHash) and [Official Download](http://www.phash.org/releases/pHash-0.9.6.tar.gz)
- Migrated from [Official Download](http://www.phash.org/releases/pHash-0.9.6.tar.gz)
  - configure.ac
  - Makefile.am
  - m4/ax_pthread.m4
- Modified
  - .gitignore
  - configure.ac
  - examples/Makefile.am
  - examples/Makefile.in
  - phash-win32/src/cimgffmpeg.cpp
  - src/Makefile.am
  - src/Makefile.in
- New
  - bindings/go/*
  - docker/*
  - README.md

### Installation on Ubuntu:focal with `aliyun` mirror
```bash
chmod +x ./docker/prepare.sh && ./docker/prepare.sh
chmod +x ./docker/download.sh && ./docker/download.sh
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
