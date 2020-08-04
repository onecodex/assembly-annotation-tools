FROM quay.io/refgenomics/builder

LABEL software.version="v2.17"

# Install vcftools

ENV MINIMAP2_VERSION v2.17

RUN git clone https://github.com/lh3/minimap2.git && \
    cd minimap2 && \
    git checkout ${MINIMAP2_VERSION} && \
    make && \
    mv minimap2 /usr/local/bin/ && \
    cd / && \
    rm -r minimap2
