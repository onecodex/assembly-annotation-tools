FROM quay.io/refgenomics/builder

LABEL software.version="1.2.11"

# Install FLASh

ENV FLASH_VERSION 1.2.11

RUN wget "http://ccb.jhu.edu/software/FLASH/FLASH-${FLASH_VERSION}-Linux-x86_64.tar.gz" && \
    tar -xzf FLASH-${FLASH_VERSION}-Linux-x86_64.tar.gz && \
    mv FLASH-${FLASH_VERSION}-Linux-x86_64/flash /usr/local/bin/ && \
    rm -r FLASH*