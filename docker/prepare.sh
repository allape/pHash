echo 'APT::Acquire::Retries "9999";' > /etc/apt/apt.conf.d/80-retries

# change archive host to `aliyun` due to poor connection with `archive.ubuntu.com`
{
  echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse";
  echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse";
  echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse";
  echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse";
  echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse";
  echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse";
  echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse";
  echo "deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse";
} > /etc/apt/sources.list

apt-get update
apt-get install -y \
  git cmake autoconf automake build-essential \
  cimg-dev libpthread-stubs0-dev ffmpeg \
  libpng-dev libjpeg-dev libtiff-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libsndfile1-dev libsamplerate0-dev libmpg123-dev
