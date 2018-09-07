FROM quay.io/refgenomics/builder

LABEL software.version="1.3.1"

# Install racon

ENV RACON_VERSION 1.3.1

RUN git clone --recursive https://github.com/isovic/racon.git && \
    mkdir -p racon/build && \
    cd racon/build && \
    git checkout ${RACON_VERSION} && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd / && \
    rm -r racon