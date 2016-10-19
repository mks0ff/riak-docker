#!/usr/bin/env bash

set -e

if env | grep -q "DOCKER_RIAK_DEBUG"; then
  set -x
fi

docker ps | egrep "hectcastro/riak" | cut -d " " -f1 | xargs -I{} docker stop {} > /dev/null 2>&1

echo "Stopped all of the running containers."
