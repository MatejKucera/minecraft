FROM debian AS mc

RUN apt-get upgrade -yqq && \
    apt-get update -yqq

RUN apt-get install git wget software-properties-common -yqq

RUN apt-get install default-jre -yqq


#RUN apt-get install software-properties-common -yqq
#RUN add-apt-repository ppa:linuxuprising/java && \
#    apt-get update -yqq     && \
#    su - && \
#    echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu focal main" | tee /etc/apt/sources.list.d/linuxuprising-java.list && \
#    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A && \
#    apt install oracle-java16-installer --install-recommends
    #apt-get install -y openjdk-8-jre-headless ca-certificates-java 

COPY docker/entrypoint.sh /entrypoint.sh

WORKDIR /app/server

ENTRYPOINT ["sh", "/entrypoint.sh"]