FROM quay.io/refgenomics/builder

LABEL software.version="1.2.38"

# Install aragorn

ENV ARAGORN_VERSION 1.2.38

RUN wget "http://mbioserv2.mbioekol.lu.se/ARAGORN/Downloads/aragorn${ARAGORN_VERSION}.tgz" && \
    tar -xzvf aragorn${ARAGORN_VERSION}.tgz && \
    cd aragorn${ARAGORN_VERSION} && \
    gcc -O3 -ffast-math -finline-functions -o aragorn aragorn${ARAGORN_VERSION}.c && \
    chmod +x aragorn && \
    mv aragorn /usr/local/bin/ && \
    cd / && \
    rm -r aragorn*