FROM quay.io/refgenomics/builder

LABEL software.version="1.1.1"

# Install Lighter

ENV LIGHTER_VERSION 1.1.1

RUN git clone https://github.com/mourisl/Lighter.git && \
    cd Lighter && \
    git checkout v${LIGHTER_VERSION} && \
    make && \
    cd / && \
    mv Lighter/lighter /usr/local/bin/ && \
    rm -r Lighter