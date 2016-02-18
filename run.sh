#!/usr/bin/env bash

DOCKER_IMAGE=deepimpact/rupert
DOCKER_VERSION=$(./datomic-version)
DOCKER_TAG=datomic-$DOCKER_VERSION

docker run \
	-p 3443:3443 \
	-p 3445:3445 \
	-p 3446:3446 \
	-v /Users/stan/engineering/database/docker-datomic/data:/var/datomic/data \
	-v /Users/stan/engineering/database/docker-datomic/config:/var/datomic/config \
	${DOCKER_IMAGE}:${DOCKER_TAG}