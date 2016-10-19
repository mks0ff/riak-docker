## Running

### Clone repository and build Riak image

```bash
$ make build
```

### Environmental variables

- `DOCKER_RIAK_CLUSTER_SIZE` – The number of nodes in your Riak cluster
  (default: `5`)
- `DOCKER_RIAK_AUTOMATIC_CLUSTERING` – A flag to automatically cluster Riak
  (default: `false`)
- `DOCKER_RIAK_DEBUG` – A flag to `set -x` on the cluster management scripts
  (default: `false`)
- `DOCKER_RIAK_BASE_HTTP_PORT` - A flag to use fixed port assignment. If set,
  manually forward port `DOCKER_RIAK_BASE_HTTP_PORT + $index` to `8098`
  (Riak's HTTP port) and forward
  `DOCKER_RIAK_BASE_HTTP_PORT + $index + DOCKER_RIAK_PROTO_BUF_PORT_OFFSET`
  to `8087` (Riak's Protocol Buffers port).
- `DOCKER_RIAK_PROTO_BUF_PORT_OFFSET` - Optional port offset (default: `100`)
- `DOCKER_RIAK_BACKEND` - Optional Riak backend to use (default: `bitcask`)
- `DOCKER_RIAK_STRONG_CONSISTENCY` - Enables strong consistency subsystem (values: `on` or `off`, default: `off`)

### Launch cluster

```bash
$ DOCKER_RIAK_AUTOMATIC_CLUSTERING=1 DOCKER_RIAK_CLUSTER_SIZE=5 DOCKER_RIAK_BACKEND=leveldb make start-cluster
./bin/start-cluster.sh

Bringing up cluster nodes:

Starting riak01..... Completed
Starting riak02..... Completed
Starting riak03..... Completed
Starting riak04..... Completed
Starting riak05..... Completed

Please wait approximately 30 seconds for the cluster to stabilize.
```

Together, these attributes let us know that this particular Riak node knows
about all of the other Riak instances.

## Stopping

```bash
$ make stop-cluster
./bin/stop-cluster.sh
Stopped all of the running containers.
```

## Destroying

```bash
$ make remove-cluster
./bin/remove-cluster.sh
Stopped the cluster and cleared all of the running containers.
```
