FROM quay.io/refgenomics/builder

LABEL software.version="3.1.0"

# Install KMC

ENV KMC_VERSION 3.1.0

RUN git clone https://github.com/refresh-bio/KMC.git && \
    cd KMC && \
    git checkout v${KMC_VERSION} && \
    make DISABLE_ASMLIB=true && \
    cd / && \
    mv KMC/bin/* /usr/local/bin/ && \
    rm -r KMC