#!/usr/bin/env bash

DOCKER_IMAGE=deepimpact/rupert
DOCKER_VERSION=$(./datomic-version)
DOCKER_TAG=datomic-$DOCKER_VERSION

#curl -u ${DATOMIC_USER_NAME}:${DATOMIC_PASS} -SL https://my.datomic.com/repo/com/datomic/datomic-pro/${DOCKER_VERSION}/datomic-pro-${DOCKER_VERSION}.zip -o datomic.zip
docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .