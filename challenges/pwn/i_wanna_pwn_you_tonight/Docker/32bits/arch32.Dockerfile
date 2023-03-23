FROM debian:bullseye-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends make gcc-multilib libc6-dev-i386

COPY ./ /src

WORKDIR /src

RUN make I_wanna_pwn_you_tonight_32_bits


FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp:latest

USER root

RUN apt-get update && apt-get install -y libc6-i386 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /src/I_wanna_pwn_you_tonight_32_bits /challenge/challenge
COPY --from=builder /src/flag.txt /challenge/

USER challenge

ENTRYPOINT ["sh", "-c", "socat TCP-LISTEN:1338,reuseaddr,fork EXEC:/challenge/challenge"]
