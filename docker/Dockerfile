FROM debian AS mc

RUN apt-get upgrade -yqq && \
    apt-get update -yqq && \
    apt-get install -y git wget software-properties-common && \
    apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main' && \
    apt-get update && \
    apt-get install -y openjdk-8-jdk
    #apt-get install -y openjdk-8-jre-headless ca-certificates-java 

COPY docker/entrypoint.sh /entrypoint.sh

WORKDIR /app/server

ENTRYPOINT ["sh", "/entrypoint.sh"]