#!/bin/sh

TAG=latest

DOCKER_REGISTRY=10.242.0.7:32000

buildSearch(){
  # docker repo
  DOCKER_REPO=$DOCKER_REGISTRY/adventurer/search
  echo "Starting build search"

  # tag image
  docker build \
    --build-arg APP_VERSION=${TAG} \
    --build-arg http_proxy=http://10.242.0.4:8118 \
    --build-arg https_proxy=http://10.242.0.4:8118 \
    -t $DOCKER_REPO:$TAG /home/sc/projects/adventurer-tech/search

  docker push $DOCKER_REPO:$TAG
}

buildAccounting(){
  # docker repo
  DOCKER_REPO=$DOCKER_REGISTRY/adventurer/accounting
  echo "Starting build accounting"
}


buildSearch
buildAccounting