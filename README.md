# pHash - http://www.phash.org

### ⚠️ Dockerized pHash does NOT support video hashing yet, and non-image hashing is not tested yet

### What have I done with [the original repo](https://github.com/aetilius/pHash) on Ubuntu Desktop 20 as root
```bash
apt update
#apt install --fix-missing
#apt autoremove

apt install -y \
  git \
  autoconf \
  automake \
  build-essential \
  cmake

apt install -y \
  cimg-dev libpthread-stubs0-dev ffmpeg \
  libpng-dev libjpeg-dev libtiff-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libsndfile1-dev libsamplerate0-dev libmpg123-dev

official_version="pHash-0.9.6"

git clone "https://github.com/aetilius/pHash"

wget "http://www.phash.org/releases/$official_version.tar.gz"
tar -xvzf "$official_version.tar.gz"

cp "$official_version/configure.ac" "pHash/configure.ac"
cp "$official_version/Makefile.am" "pHash/Makefile.am"
cp "$official_version/ltmain.sh" "pHash/ltmain.sh"
cp -R "$official_version/m4" "pHash/m4"
```

### Modified Files, Base on [Official Repo](https://github.com/aetilius/pHash) and [Official Download](http://www.phash.org/releases/pHash-0.9.6.tar.gz)
- .gitignore
- configure.ac:252
- examples/Makefile.am:2

### Installation on Ubuntu 20
```bash
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
