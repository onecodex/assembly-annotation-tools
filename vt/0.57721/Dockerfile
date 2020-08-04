FROM quay.io/refgenomics/builder

LABEL software.version="0.57721"

# Install vcftools

ENV VT_VERSION 0.57721

RUN git clone https://github.com/atks/vt && \
    cd vt && \
    git checkout ${VT_VERSION} && \
    make && \
    mv vt /usr/local/bin/ && \
    cd / && \
    rm -r vt