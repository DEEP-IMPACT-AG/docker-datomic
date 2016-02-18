FROM pointslope/clojure:lein-2.5.3

MAINTAINER Christian Romney "cromney@pointslope.com"
MAINTAINER Stanilas Nanchen "stan@deepimpact.ch"

ENV DATOMIC_DATA /var/datomic/data
ENV DATOMIC_CONFIG /var/datomic/config

RUN mkdir -p $DATOMIC_DATA && mkdir -p $DATOMIC_CONFIG

VOLUME $DATOMIC_DATA
VOLUME $DATOMIC_CONFIG

ENV DATOMIC_VERSION 0.9.5344
ENV DATOMIC_HOME /opt/datomic-pro-$DATOMIC_VERSION

EXPOSE 4334 4335 4336

ADD datomic.zip /tmp/datomic.zip

RUN unzip /tmp/datomic.zip -d /opt \
  && rm -f /tmp/datomic.zip

WORKDIR $DATOMIC_HOME

ENTRYPOINT ["./bin/transactor"]

CMD ["/var/datomic/config/transactor.properties"]
