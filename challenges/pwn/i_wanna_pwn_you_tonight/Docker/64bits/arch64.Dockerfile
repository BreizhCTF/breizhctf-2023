FROM debian:bullseye-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends make gcc libc-dev

COPY ./ /src

WORKDIR /src

RUN make I_wanna_pwn_you_tonight_64_bits


FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp:latest

USER root

COPY --from=builder /src/I_wanna_pwn_you_tonight_64_bits /challenge/challenge
COPY --from=builder /src/flag.txt /challenge/

USER challenge

ENV SOCAT_OPTIONS=""
