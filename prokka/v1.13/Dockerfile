FROM quay.io/refgenomics/bioperl

LABEL software.version="v1.13"

COPY --from=quay.io/refgenomics/aragorn:1.2.38 /usr/local/bin/aragorn /usr/local/bin/

COPY --from=quay.io/refgenomics/prodigal:2.6.3 /usr/local/bin/prodigal /usr/local/bin/

COPY --from=quay.io/refgenomics/tbl2asn:latest /usr/local/bin/tbl2asn /usr/local/bin/

COPY --from=quay.io/refgenomics/hmmer:3.2.1 /usr/local/bin/* /usr/local/bin/

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

# Install Prokka

RUN apt-get update && apt-get install -y \
    default-jre \
    git \
    ncbi-blast+ \
    parallel && \
    rm -rf /var/lib/apt

# Install barrnap

ENV BARRNAP_VERSION 0.9

RUN git clone https://github.com/tseemann/barrnap.git /usr/local/barrnap && \
    cd /usr/local/barrnap && \
    git checkout ${BARRNAP_VERSION}

ENV PATH $PATH:/usr/local/barrnap/bin

ENV PROKKA_VERSION 1.13

RUN git clone https://github.com/tseemann/prokka.git /usr/local/prokka && \
    cd /usr/local/prokka && \
    git checkout v${PROKKA_VERSION} && \
    rm -rf perl5 && \
    mkdir perl5

ENV PATH $PATH:/usr/local/prokka/bin

RUN prokka --setupdb
