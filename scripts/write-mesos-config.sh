#!/bin/bash

EXECUTOR_URI=${EXECUTOR_URI:-"http://downloads.mesosphere.io/elasticsearch/elasticsearch-mesos-0.90.10-1.tgz"}
MESOS_MASTER_URL=${MESOS_MASTER_URL:-"zk://localhost:2181/mesos"}
JAVA_LIB_PATH=${JAVA_LIB_PATH:-"/usr/local/lib"}

NUMBER_OF_NODES=${NUMBER_OF_NODES:-1}

DISK_REQUESTED=${DISK_REQUESTED:-250}
MEMORY_REQUESTED=${MEMORY_REQUESTED:-256}
CPU_UNITS_REQUESTED=${CPU_UNITS_REQUESTED:-0.1}

cat > /opt/elasticsearch-mesos/config/mesos.yml <<EOF
mesos.executor.uri: $EXECUTOR_URI

# Where the Mesos master is located
mesos.master.url: $MESOS_MASTER_URL

# Where we can find the Mesos library
java.library.path: $JAVA_LIB_PATH

# No of HW nodes we want it to run on
# Driver will block until we have enough nodes
# (We can't start multiple Elastic Search nodes of the same cluster on the same HW node due to port conflicts)
elasticsearch.noOfHwNodes: $NUMBER_OF_NODES

# Mesos resource requests
resource.cpus: $CPU_UNITS_REQUESTED
resource.mem: $MEMORY_REQUESTED
resource.disk: $DISK_REQUESTED
EOF
