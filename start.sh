#!/bin/bash

## Write the configs first.
/opt/elasticsearch-mesos/bin/write-elasticsearch-config.sh
/opt/elasticsearch-mesos/bin/write-mesos-config.sh

exec /opt/elasticsearch-mesos/bin/elasticsearch-mesos
