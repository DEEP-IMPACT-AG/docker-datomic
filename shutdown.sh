#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ${DIR}/config/transactor.properties

docker stop datomic_container
docker rm datomic_container