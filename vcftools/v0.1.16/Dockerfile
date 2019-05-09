FROM quay.io/refgenomics/builder

LABEL software.version="v0.1.16"

# Install vcftools

ENV VCFTOOLS_VERSION v0.1.16

ENV PERL5LIB /vcftools/src/perl/

RUN git clone --recursive https://github.com/vcftools/vcftools.git && \
    cd vcftools && \
    git checkout ${VCFTOOLS_VERSION} && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    mkdir -p /usr/local/lib/vcftools && \
    mv /vcftools/src/perl/*.pm /usr/local/lib/vcftools && \
    rm -r vcftools