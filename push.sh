#!/usr/bin/env bash

DOCKER_IMAGE=deepimpact/rupert
DOCKER_VERSION=$(./datomic-version)
DOCKER_TAG=datomic-$DOCKER_VERSION

docker login -u $DOCKER_HUB_USERNAME -e $DOCKER_HUB_EMAIL -p $DOCKER_HUB_PASSWORD

docker push ${DOCKER_IMAGE}:${DOCKER_TAG}

rm -f ~/.docker/config.json