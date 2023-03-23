#!/usr/bin/env bash

docker build -t nanomachines ../Docker

container=$(docker run --rm -d nanomachines)

docker cp -L ${container}:/lib/x86_64-linux-gnu/libc.so.6 ./
docker cp ${container}:/challenge/challenge ./

docker kill ${container}
