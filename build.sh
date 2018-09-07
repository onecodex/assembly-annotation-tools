#!/bin/bash

set -e

tool=$(echo $1 | cut -f1 -d:)
ver=$(echo $1 | cut -f2 -d:)

image="quay.io/refgenomics/${tool}"

echo "Building ${image}"

cd ${tool}/${ver}
docker build . -t $image -t ${image}:${ver}
docker push $image
docker push ${image}:${ver}