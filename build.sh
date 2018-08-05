#!/bin/bash

ORG='minervaprime'
IMAGE='centos'
TAG=${1:-latest}

echo "Building $ORG/${IMAGE}:$TAG"
docker build -t $ORG/${IMAGE}:$TAG --no-cache .
docker push $ORG/${IMAGE}:$TAG