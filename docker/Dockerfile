FROM openjdk:21-jdk-bullseye AS mc

RUN apt-get upgrade -yqq && \
    apt-get update -yqq

RUN apt-get install git wget software-properties-common -yqq

WORKDIR /app

COPY docker/source/BuildTools.jar /app/BuildTools.jar
RUN java -Xmx4G -jar BuildTools.jar -rev 1.21.1 

COPY docker/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]