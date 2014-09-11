# docker-elasticsearch-mesos

A docker container which runs the [elasticsearch-mesos] framework

## Environmental Variable

## Ports Exposed

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
