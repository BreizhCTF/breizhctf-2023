FROM debian:bullseye-slim AS builder

RUN apt-get update && apt-get install -y make gcc-multilib libc6-dev-i386

COPY ./src /src

WORKDIR /src

RUN make demineur


FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp:latest

USER root

RUN apt-get update && apt-get install -y libc6-i386 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /src/demineur /challenge/challenge
COPY --from=builder /src/flag.txt /challenge/

USER challenge

ENV SOCAT_OPTIONS=""
