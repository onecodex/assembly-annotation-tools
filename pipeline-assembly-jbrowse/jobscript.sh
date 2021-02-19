#!/bin/bash

set -euo pipefail

reference_fasta="${1}"
reads_fastq="${2}"
prefix=$(basename "${reads_fastq}" .fastq.gz)

jbrowse create . --force

minimap2 \
  -a \
  -x sr \
  "${reference_fasta}" \
  "${reads_fastq}" \
  | samtools \
    view \
    -u \
    -h \
    -F 4 \
    - \
  | samtools sort -@ 4 - \
  > "${prefix}-mapping.bam"

samtools faidx "${reference_fasta}"
samtools index "${prefix}-mapping.bam"
bamCoverage -b "${prefix}-mapping.bam" -o "${prefix}-coverage.bw"

jbrowse add-assembly --load inPlace "${reference_fasta}"
jbrowse add-track --load inPlace "${prefix}-mapping.bam"
jbrowse add-track --load inPlace "${prefix}-coverage.bw"
