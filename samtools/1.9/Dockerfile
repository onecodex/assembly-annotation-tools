FROM quay.io/refgenomics/builder

LABEL software.version="1.9"

# Install htslib

ENV SAMTOOLS_VERSION 1.9

RUN git clone https://github.com/samtools/htslib.git && \
    cd htslib && \
    git checkout ${SAMTOOLS_VERSION} && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    cd / && \
    rm -r htslib

# Install samtools

RUN git clone https://github.com/samtools/samtools.git && \
    cd samtools && \
    git checkout ${SAMTOOLS_VERSION} && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix=/usr/local --without-curses && \
    make && \
    make install && \
    cd / && \
    rm -r samtools

# Install bcftools

RUN git clone https://github.com/samtools/bcftools.git && \
    cd bcftools && \
    git checkout ${SAMTOOLS_VERSION} && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    cd / && \
    rm -r bcftools