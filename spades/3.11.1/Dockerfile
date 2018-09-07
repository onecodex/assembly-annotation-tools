FROM quay.io/refgenomics/builder

LABEL software.version="3.11.1"

# Install SPAdes

ENV SPADES_VERSION 3.11.1

RUN wget "http://cab.spbu.ru/files/release${SPADES_VERSION}/SPAdes-${SPADES_VERSION}.tar.gz" && \
    tar -xzvf SPAdes-${SPADES_VERSION}.tar.gz && \
    mkdir -p /SPAdes-${SPADES_VERSION}/src/build && \
    cd SPAdes-${SPADES_VERSION}/src/build && \
    cmake .. && \
    make install && \
    cd / && \
    rm -r SPAdes-${SPADES_VERSION}*