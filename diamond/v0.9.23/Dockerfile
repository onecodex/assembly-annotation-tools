FROM quay.io/refgenomics/builder

LABEL software.version="v0.9.23"

# Install DIAMOND

ENV DIAMOND_VERSION 0.9.23

RUN git clone https://github.com/bbuchfink/diamond.git && \
    cd diamond && \
    git checkout v${DIAMOND_VERSION} && \
    mkdir bin && \
    cd bin && \
    cmake .. && \
    make install && \
    cd / && \
    rm -r diamond