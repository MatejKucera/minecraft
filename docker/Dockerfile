FROM openjdk:18-jdk-buster AS mc

RUN apt-get upgrade -yqq && \
    apt-get update -yqq

RUN apt-get install git wget software-properties-common -yqq

WORKDIR /app

COPY docker/source/BuildTools.jar /app/BuildTools.jar
RUN java -jar BuildTools.jar

COPY docker/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]