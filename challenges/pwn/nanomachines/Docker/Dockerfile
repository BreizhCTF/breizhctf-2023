FROM debian:bullseye-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends make gcc libc-dev

COPY ./src /src

WORKDIR /src

RUN make nanomachines


FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp:latest

USER root

# RUN apt-get update && apt-get install - && rm -rf /var/lib/apt/lists/*

COPY --from=builder /src/nanomachines /challenge/challenge
COPY --from=builder /src/flag.txt /challenge/

USER challenge

ENV SOCAT_OPTIONS=""
