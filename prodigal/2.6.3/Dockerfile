FROM quay.io/refgenomics/builder

LABEL software.version="2.6.3"

# Install Prodigal

ENV PRODIGAL_VERSION 2.6.3

RUN wget "https://github.com/hyattpd/Prodigal/releases/download/v${PRODIGAL_VERSION}/prodigal.linux" && \
    chmod +x prodigal.linux && \
    mv prodigal.linux /usr/local/bin/prodigal