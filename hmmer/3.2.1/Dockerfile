FROM quay.io/refgenomics/builder

LABEL software.version="3.2.1"

# Install HMMER

ENV HMMER_VERSION 3.2.1

RUN wget "http://eddylab.org/software/hmmer/hmmer.tar.gz" && \
    tar -zxf hmmer.tar.gz && \
    cd hmmer-${HMMER_VERSION} && \
    ./configure --prefix /usr/local && \
    make && \
    make install && \
    cd / && \
    rm -r hmmer*