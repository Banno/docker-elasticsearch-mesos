FROM registry.banno-internal.com/java

# Install base deps
RUN apt-get update && apt-get install -y wget

# Install mesos, for the libs
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN echo "deb http://repos.mesosphere.io/ubuntu trusty-testing main" >> /etc/apt/sources.list
RUN echo "deb https://get.docker.io/ubuntu docker main" >> /etc/apt/sources.list
RUN apt-get install -y apt-transport-https
RUN apt-get -y update && apt-get -y install mesos

# Download the prebuilt tarbal
RUN wget -O /opt/elasticsearch-mesos.tar.gz https://s3.amazonaws.com/adam-sandbox/elasticsearch-mesos-1.3.2-0.20.0-1.tgz
RUN cd /opt/ && \
    tar xf elasticsearch-mesos.tar.gz && \
    rm elasticsearch-mesos.tar.gz && \
    mv elasticsearch-mesos-1.3.2-0.20.0-1 elasticsearch-mesos

# Should fix the 'file not found' for config/mesos.yml
WORKDIR /opt/elasticsearch-mesos/

## Add startup scripts.
ADD scripts/write-elasticsearch-config.sh /opt/elasticsearch-mesos/bin/write-elasticsearch-config.sh
ADD scripts/write-mesos-config.sh /opt/elasticsearch-mesos/bin/write-mesos-config.sh
ADD start.sh /opt/elasticsearch-mesos/bin/start.sh
RUN chmod +x /opt/elasticsearch-mesos/bin/*sh

CMD ["/opt/elasticsearch-mesos/bin/start.sh"]
