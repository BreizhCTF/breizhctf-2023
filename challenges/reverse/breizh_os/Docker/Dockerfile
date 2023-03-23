# FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/python-flask AS builder
FROM rust:alpine3.17 AS builder

RUN apk add make nasm musl-dev

# RUN apk add build-base make nasm procps uuidgen
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# ENV PATH="${PATH}:/root/.cargo/bin/"
RUN rustup default nightly
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-musl

# Create env / img
WORKDIR /breizhOS/
COPY breizhOS /breizhOS/
RUN make clear
RUN make init
RUN make bootloader
RUN make kernel

FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/python-flask

USER root

RUN apk add make qemu qemu-img qemu-system-x86_64 binutils

COPY --from=builder /breizhOS/bin /breizhOS/bin
COPY --from=builder /breizhOS/Makefile /breizhOS/link.ld /breizhOS/emulate.sh /breizhOS/
RUN mkdir /breizhOS/img

WORKDIR /challenge/
COPY web /challenge

RUN chmod +x /challenge/server.py

USER nginx
