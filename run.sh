#!/usr/bin/env bash

docker login -u $DOCKER_HUB_USERNAME -e $DOCKER_HUB_EMAIL -p $DOCKER_HUB_PASSWORD

DOCKER_IMAGE=deepimpact/rupert
DOCKER_VERSION=$(./datomic-version)
DOCKER_TAG=datomic-$DOCKER_VERSION
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "config" ]; then
	mkdir config
fi

if [ ! -d "data" ]; then
	mkdir data
fi

cat > ${DIR}/config/transactor.properties << EOF
protocol=ddb-local
host=localhost
port=4334
license-key=$DATOMIC_PRO_LICENSE_KEY
aws-dynamodb-table=tamara
aws-dynamodb-override-endpoint=localhost:8080
memory-index-threshold=32m
memory-index-max=256m
object-cache-max=128m
EOF

docker run -d \
	-p 4334:4334 \
	-p 8080:8080 \
	-v ${DIR}/data:/var/datomic/data \
	-v ${DIR}/config:/var/datomic/config \
	--name="datomic_container" \
	${DOCKER_IMAGE}:${DOCKER_TAG}

rm -f ~/.docker/config.json