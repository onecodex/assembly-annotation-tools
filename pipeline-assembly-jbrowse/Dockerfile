FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  nodejs \
  npm \
  python3 \
  python3-pip \
  samtools \
  minimap2

RUN npm install -g \
  @jbrowse/cli

RUN pip3 install deeptools

WORKDIR /work/

ADD jobscript.sh .
