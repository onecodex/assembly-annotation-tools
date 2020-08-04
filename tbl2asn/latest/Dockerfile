FROM quay.io/refgenomics/builder

LABEL software.version="latest"

# Install tbl2asn
# (note: this binary expires)
RUN wget "https://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz" && \
    pigz -d linux64.tbl2asn.gz && \
    chmod +x linux64.tbl2asn && \
    mv linux64.tbl2asn /usr/local/bin/tbl2asn
