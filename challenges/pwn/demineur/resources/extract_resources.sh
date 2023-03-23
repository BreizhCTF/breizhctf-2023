#!/usr/bin/env bash

docker build -t demineur ../Docker

container=$(docker run --rm -d demineur)

docker cp -L ${container}:/lib32/libc.so.6 ./
docker cp ${container}:/challenge/challenge ./

docker kill ${container}
