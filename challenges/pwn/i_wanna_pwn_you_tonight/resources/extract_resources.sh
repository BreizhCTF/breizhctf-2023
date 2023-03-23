#!/usr/bin/env bash

docker build -t iwannapwnyoutonight ../Docker/32bits

container=$(docker run --rm -d iwannapwnyoutonight)

docker cp ${container}:/challenge/challenge ./challenge_32_bits

docker kill ${container}

# 64 bits

docker build -t iwannapwnyoutonight ../Docker/64bits

container=$(docker run --rm -d iwannapwnyoutonight)

docker cp ${container}:/challenge/challenge ./challenge_64_bits

docker kill ${container}
