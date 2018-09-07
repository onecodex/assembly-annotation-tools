FROM quay.io/refgenomics/builder

LABEL software.version="v0.7.17"

# Install BWA

ENV BWA_VERSION 0.7.17

RUN git clone https://github.com/lh3/bwa.git && \
    cd bwa && \
    git checkout v${BWA_VERSION} && \
    make && \
    cd / && \
    mv bwa/bwa /usr/local/bin/ && \
    rm -r bwa