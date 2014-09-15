# docker-elasticsearch-mesos

A docker container which runs the [elasticsearch-mesos] framework

## Versions

- Elasticsearch: `0.90.10-1`
- Mesos: `0.20.0-1`

## Environmental Variable

__Things you'll probably change__

- DISK_REQUESTED
- MEMORY_REQUESTED
- CPU_UNITS_REQUESTED

__Ones you won't__

- EXECUTOR_URI
- MESOS_MASTER_URL
- JAVA_LIB_PATH
- NUMBER_OF_NODES

## Ports Exposed

__Defaults__

- 9200
- 9300

## Steps

__build__

```
docker build -t registry.banno-internal.com/elasticsearch-mesos .
```

__run__

Run as a mesos task via [banno-deploy]

__pull__

```
docker pull registry.banno-internal.com/elasticsearch-mesos
```

__push__

```
docker push registry.banno-internal.com/elasticsearch-mesos
```

[banno-deploy]: https://github.com/Banno/banno-deploy
[elasticsearch-mesos]: https://github.com/Banno/elasticsearch-mesos
