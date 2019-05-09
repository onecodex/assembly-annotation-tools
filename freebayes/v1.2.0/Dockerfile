FROM quay.io/refgenomics/builder

LABEL software.version="v1.2.0"

# Install freebayes

ENV FREEBAYES_VERSION v1.2.0

RUN git clone --recursive https://github.com/ekg/freebayes.git && \
    cd freebayes && \
    git checkout ${FREEBAYES_VERSION} && \
    make && \
    make install && \
    cp scripts/* /usr/local/bin/ && \
    cd / && \
    rm -r freebayes