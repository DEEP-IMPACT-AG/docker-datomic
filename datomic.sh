#!/usr/bin/env bash

DYNAMODB_FOLDER="/opt/dynamodb/"
DYNAMODB_PORT="8080"

export AWS_ACCESS_KEY_ID="local-access-key"
export AWS_SECRET_ACCESS_KEY="local-secret-key"
export AWS_SECRET_KEY="local-secret-key"

# Launch DynamoDB

echo "Starting DynamoDB..."

java -Djava.library.path=${DYNAMODB_FOLDER}/DynamoDBLocal_lib \
	-jar ${DYNAMODB_FOLDER}/DynamoDBLocal.jar \
	-sharedDb -port $DYNAMODB_PORT \
	-dbPath /var/datomic/data &
sleep 2

echo "Ensuring the transactor..."

./bin/datomic ensure-transactor /var/datomic/config/transactor.properties /var/datomic/config/transactor.properties

echo "Starting Datomic..."

./bin/transactor /var/datomic/config/transactor.properties