FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y \
      bioperl \
      libfaketime \
      libidn11 \
      wget \
      build-essential \
    && \
    rm -rf /var/lib/apt

LABEL software.version="v1.14.0"

# Install aragorn

ENV ARAGORN_VERSION 1.2.38

RUN wget "http://mbioserv2.mbioekol.lu.se/ARAGORN/Downloads/aragorn${ARAGORN_VERSION}.tgz" && \
    tar -xzvf aragorn${ARAGORN_VERSION}.tgz && \
    cd aragorn${ARAGORN_VERSION} && \
    gcc -O3 -ffast-math -finline-functions -o aragorn aragorn${ARAGORN_VERSION}.c && \
    chmod +x aragorn && \
    mv aragorn /usr/local/bin/ && \
    cd / && \
    rm -r aragorn*

# Install Prodigal

ENV PRODIGAL_VERSION 2.6.3

RUN wget "https://github.com/hyattpd/Prodigal/releases/download/v${PRODIGAL_VERSION}/prodigal.linux" && \
    chmod +x prodigal.linux && \
    mv prodigal.linux /usr/local/bin/prodigal

# Install tbl2asn
RUN wget "https://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz" && \
    gunzip linux64.tbl2asn.gz && \
    chmod +x linux64.tbl2asn && \
    mv linux64.tbl2asn /usr/local/bin/tbl2asn

# prevent tbl2asn from expiring
# (see https://github.com/audy/tbl2asn-forever)
RUN echo 'set -euo pipefail LD_PRELOAD=/usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1 FAKETIME="2019-01-01 00:00:01" /usr/bin/real-tbl2asn $*' \
  > /usr/local/bin/tbl2asn \
  && chmod +x /usr/local/bin/tbl2asn

# Install HMMER

ENV HMMER_VERSION 3.2.1

RUN wget "http://eddylab.org/software/hmmer/hmmer-3.2.1.tar.gz" && \
    tar -zxf hmmer-3.2.1.tar.gz && \
    cd hmmer-${HMMER_VERSION} && \
    ./configure --prefix /usr/local && \
    make && \
    make install && \
    cd / && \
    rm -r hmmer*

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

# Install Prokka

RUN apt-get update && apt-get install -y \
    default-jre \
    git \
    ncbi-blast+ \
    parallel && \
    rm -rf /var/lib/apt

# Install barrnap

ENV BARRNAP_VERSION 0.9

RUN git clone https://github.com/tseemann/barrnap.git /usr/local/barrnap && \
    cd /usr/local/barrnap && \
    git checkout ${BARRNAP_VERSION}

ENV PATH $PATH:/usr/local/barrnap/bin

ENV PROKKA_VERSION 1.14.0

RUN git clone https://github.com/tseemann/prokka.git /usr/local/prokka && \
    cd /usr/local/prokka && \
    git checkout v${PROKKA_VERSION}

ENV PATH $PATH:/usr/local/prokka/bin
