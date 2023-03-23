# Transpile sage file separately to save some space
FROM sagemath/sagemath AS builder

USER root

RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

RUN useradd -u 666 --home=/challenge -U challenge

WORKDIR /challenge/

COPY chall.sage .
COPY flag.py .

RUN sage --preparse chall.sage && \
    rm chall.sage

USER sage

ENV SOCAT_OPTIONS=",stderr,pty,cfmakeraw,echo=0"

ENTRYPOINT ["sh", "-c", "socat TCP-LISTEN:1337,reuseaddr,fork EXEC:'sage --python chall.sage.py'${SOCAT_OPTIONS}"]


# Final docker image
# FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp

# USER root

# RUN apt-get update && apt-get install -y --no-install-recommends sagemath python3-pip && rm -rf /var/lib/apt/lists/*

# COPY --from=builder /chall.sage.py /challenge/challenge
# RUN sed -i '1 i\#!/usr/bin/env python3' /challenge/challenge
# COPY flag.py /challenge/flag.py

# RUN chmod +x /challenge/challenge
# # RUN chown -R challenge:challenge /challenge
# # RUN chown -R root:root /challenge/*

# USER challenge
