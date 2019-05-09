FROM quay.io/refgenomics/bioperl

LABEL software.version="v3.2"

ENV PERL5LIB /usr/local/lib/vcftools/

COPY --from=quay.io/refgenomics/bwa:v0.7.17 /usr/local/bin/* /usr/local/bin/

COPY --from=quay.io/refgenomics/samtools:1.9 /usr/local/bin/* /usr/local/bin/

COPY --from=quay.io/refgenomics/samtools:1.9 /usr/local/bin/* /usr/local/bin/

COPY --from=quay.io/refgenomics/samtools:1.9 /usr/local/lib/libhts* /usr/local/lib/

COPY --from=quay.io/refgenomics/freebayes:v1.2.0 /usr/local/bin/freebayes /usr/local/bin/

COPY --from=quay.io/refgenomics/vcflib:v1.0.0-rc2 /usr/local/bin/* /usr/local/bin/

COPY --from=quay.io/refgenomics/vcftools:v0.1.16 /usr/local/bin/* /usr/local/bin/

COPY --from=quay.io/refgenomics/vcftools:v0.1.16 /usr/local/lib/vcftools/* /usr/local/lib/vcftools/

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

# Install snippy

RUN apt-get update && apt-get install -y \
    default-jre \
    git \
    libfile-slurp-perl \
    parallel && \
    rm -rf /var/lib/apt

ENV SNIPPY_VERSION v3.2

RUN git clone https://github.com/tseemann/snippy.git /usr/local/snippy && \
    cd /usr/local/snippy && \
    git checkout ${SNIPPY_VERSION}

ENV PATH $PATH:/usr/local/snippy/bin

CMD ["snippy", "--help"]

