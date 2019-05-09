FROM quay.io/refgenomics/builder

LABEL software.version="v1.0.0-rc2"

# Install vcflib

ENV VCFLIB_VERSION v1.0.0-rc2

RUN git clone --recursive https://github.com/vcflib/vcflib.git && \
    cd vcflib && \
    git checkout ${VCFLIB_VERSION} && \
    make && \
    mv bin/* /usr/local/bin && \
    cd / && \
    rm -r vcflib