FROM debian:stretch-slim

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

RUN apt-get update && apt-get install -y \
        autoconf \
        build-essential \
        cmake \
        default-jre \
        git \
        libbz2-dev \
        liblzma-dev \
        libz-dev \
        locales \
        pigz \
        python \
        python-dev \
        python-pip \
        python3 \
        python3-dev \
        python3-pip \
        unzip \
        wget && \
        rm -rf /var/lib/apt