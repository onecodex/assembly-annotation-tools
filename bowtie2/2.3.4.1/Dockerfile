FROM quay.io/refgenomics/builder

LABEL software.version="2.3.4.1"

# Install bowtie2

ENV BOWTIE2_VERSION 2.3.4.1

RUN wget "https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE2_VERSION}/bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip" && \
    unzip bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip && \
    mv bowtie2-${BOWTIE2_VERSION}-linux-x86_64/bowtie2* /usr/local/bin/ && \
    rm -r bowtie2*