FROM pointslope/clojure:lein-2.5.3

MAINTAINER Christian Romney "cromney@pointslope.com"
MAINTAINER Stanislas Nanchen "stan@deepimpact.ch"

ENV DATOMIC_DATA /var/datomic/data
ENV DATOMIC_CONFIG /var/datomic/config

RUN mkdir -p $DATOMIC_DATA && mkdir -p $DATOMIC_CONFIG

VOLUME $DATOMIC_DATA
VOLUME $DATOMIC_CONFIG

ENV DATOMIC_VERSION 0.9.5327
ENV DATOMIC_HOME /opt/datomic-pro-$DATOMIC_VERSION

EXPOSE 4334 8080

WORKDIR /opt

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest
RUN mkdir dynamodb
RUN tar -xvzf dynamodb_local_latest -C dynamodb && rm -f dynamodb_local_latest

ADD datomic.zip /tmp/datomic.zip
RUN unzip /tmp/datomic.zip -d /opt && rm -f /tmp/datomic.zip
ADD datomic.sh ${DATOMIC_HOME}

WORKDIR $DATOMIC_HOME

ENTRYPOINT ["./datomic.sh"]
