FROM quay.io/refgenomics/builder

LABEL software.version="v1.3"

# Install seqtk

ENV SEQTK_VERSION 1.3

RUN git clone https://github.com/lh3/seqtk.git && \
    cd seqtk && \
    git checkout v${SEQTK_VERSION} && \
    make && \
    cd / && \
    mv seqtk/seqtk /usr/local/bin/ && \
    rm -r seqtk