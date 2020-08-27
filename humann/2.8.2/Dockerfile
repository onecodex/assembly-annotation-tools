FROM ubuntu:18.04

LABEL software.version="2.8.2"

WORKDIR /humann2

ENV BOWTIE_VERSION 2.4.1
ENV DIAMOND_VERSION 0.8.38
ENV HUMANN_VERSION 2.8.2
ENV METAPHLAN_VERSION 2.8

# General dependencies
RUN apt-get update \
    && apt-get install -y \
    git \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    python3 \
    python3-dev \
    python3-pip \
    wget \
    zip \
    && apt-get clean

# Necessary for executing scripts as ./metaphlan2.py instead of python metaphlan2.py
# which humann2 does
RUN ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip

# Install bowtie2
RUN wget --quiet https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE_VERSION}/bowtie2-${BOWTIE_VERSION}-linux-x86_64.zip \
    && unzip bowtie2-${BOWTIE_VERSION}-linux-x86_64.zip \
    && chmod +x bowtie2-${BOWTIE_VERSION}-linux-x86_64/bowtie2* \
    && mv bowtie2-${BOWTIE_VERSION}-linux-x86_64/bowtie2* /usr/local/bin \
    && rm -rf bowtie2*

# Install diamond
RUN wget --quiet https://github.com/bbuchfink/diamond/releases/download/v${DIAMOND_VERSION}/diamond-linux64.tar.gz \
    && tar -xf diamond-linux64.tar.gz \
    && chmod +x diamond \
    && mv diamond /usr/local/bin \
    && rm -rf diamond*

COPY requirements.txt .

# Install humann2 and metaphlan python requirements. This also installs humann2. biom-format is
# installed afterward otherwise pip complains about numpy not being installed
RUN pip install -r requirements.txt \
    && pip install biom-format==2.1.7 \
    && rm -f requirements.txt

# Install metaphlan
RUN wget --quiet https://github.com/biobakery/MetaPhlAn/archive/${METAPHLAN_VERSION}.tar.gz \
    && tar -xf ${METAPHLAN_VERSION}.tar.gz \
    && mv ./MetaPhlAn-${METAPHLAN_VERSION}/*.py /usr/local/bin \
    && mv ./MetaPhlAn-${METAPHLAN_VERSION}/utils/*.py /usr/local/bin \
    && rm -rf ./MetaPhlAn-${METAPHLAN_VERSION} \
    && rm -rf ${METAPHLAN_VERSION}.tar.gz

# Install humann2 example datasets
# Test the installation with the command: humann2 --input examples/demo.fasta --output output
RUN wget --quiet https://github.com/biobakery/humann/archive/${HUMANN_VERSION}.tar.gz \
    && tar -xf ${HUMANN_VERSION}.tar.gz \
    && mv humann-${HUMANN_VERSION}/examples ./ \
    && rm -rf humann-${HUMANN_VERSION} \
    && rm -rf ${HUMANN_VERSION}.tar.gz

CMD ["/bin/bash"]
