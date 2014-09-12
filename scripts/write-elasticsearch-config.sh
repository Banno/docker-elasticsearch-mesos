#!/bin/bash

HTTP_PORT=${HTTP_PORT:-$PORT0}
DATA_PORT=${DATA_PORT:-$PORT1}
CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch}

cat > /opt/elasticsearch-mesos/config/elasticsearch.yml <<EOF
cluster.name: "$CLUSTER_NAME"
transport.tcp.port: $DATA_PORT
http.port: $HTTP_PORT

# Specific configs needed for running on mesos.
discovery.zen.ping.multicast.enabled: false
discovery.zen.ping.unicast.hosts: [${seedNodes}]
EOF

exit 0;
