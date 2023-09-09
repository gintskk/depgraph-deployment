FROM openjdk:11-slim AS setup

ARG kafka_version=kafka_2.13-3.3.1

RUN apt-get update &&\
	apt-get install wget -y --fix-missing

WORKDIR /root
RUN wget https://dlcdn.apache.org/kafka/3.3.1/${kafka_version}.tgz &&\
	tar xvzf ${kafka_version}.tgz &&\
	ln -s /root/${kafka_version} /kafka


FROM openjdk:11-slim AS container

ARG kafka_version=kafka_2.13-3.3.1

COPY --from=setup /root/${kafka_version} /root/${kafka_version}
COPY server.properties /root/${kafka_version}/config/kraft/

WORKDIR /root/${kafka_version}

RUN echo "\nalias ls=\"ls --color -hal\"\n"  > .bashrc &&\
	KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)" &&\
	bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

ENTRYPOINT ["bin/kafka-server-start.sh"]
CMD ["config/kraft/server.properties"]

EXPOSE 9092
