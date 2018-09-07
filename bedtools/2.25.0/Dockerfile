FROM quay.io/refgenomics/builder

LABEL software.version="2.25.0"

# Install bedtools

ENV BEDTOOLS_VERSION 2.25.0

RUN wget "https://github.com/arq5x/bedtools2/releases/download/v${BEDTOOLS_VERSION}/bedtools-${BEDTOOLS_VERSION}.tar.gz" && \
    tar -xzvf bedtools-${BEDTOOLS_VERSION}.tar.gz && \
    cd bedtools2 && \
    make && \
    mv bin/* /usr/local/bin/ && \
    cd / && \
    rm -r bedtools2*