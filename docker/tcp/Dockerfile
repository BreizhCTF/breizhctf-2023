FROM debian:bullseye-slim

ENV TIMEZONE Europe/Paris

# RUN apk add --no-cache socat gcc libressl-dev libc-dev
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

RUN useradd -u 666 --home=/challenge -U challenge

WORKDIR /challenge/

USER challenge

ENV SOCAT_OPTIONS=",stderr,pty,cfmakeraw,echo=0"

USER challenge

ENTRYPOINT ["sh", "-c", "socat TCP-LISTEN:1337,reuseaddr,fork EXEC:/challenge/challenge${SOCAT_OPTIONS}"]
