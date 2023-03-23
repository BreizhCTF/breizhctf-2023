# Compiler stage
FROM debian:bullseye-slim AS builder

RUN apt-get update && apt-get install -y gcc

COPY ./src/wrapper.c /

RUN gcc -o wrapper wrapper.c


# Final stage
FROM debian:bullseye-slim

# Add challenge user and install dependencies
RUN useradd -u 666 -m -d /challenge -U challenge -s /bin/bash

WORKDIR /challenge/

RUN apt-get update && \
    apt-get install --no-install-recommends -y gdb nano vim openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -u 777 -U administrator 
COPY --chown=challenge:challenge challenge.key.pub /challenge/.ssh/authorized_keys
RUN chmod -R go-rwx /challenge/.ssh

# Configure sshd as non-root
RUN mkdir /opt/ssh && \
    cp /etc/ssh/sshd_config /opt/ && \
    ssh-keygen -q -N "" -t dsa -f /opt/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -b 4096 -f /opt/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t ecdsa -f /opt/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t ed25519 -f /opt/ssh/ssh_host_ed25519_key
COPY sshd_config /opt/ssh/
RUN chmod -R o+r /opt/ssh && chmod o+w /opt/ssh


# Configure challenge directory
COPY --chown=administrator:administrator ./src/breizhjack ./src/flag.txt /challenge/breizhjack/
COPY --chown=administrator:administrator --from=builder /wrapper /challenge/breizhjack/
COPY --chown=challenge:challenge ./src/cards.txt /challenge/
RUN ln -s ../cards.txt /challenge/breizhjack/cards.txt

RUN chmod +x breizhjack/breizhjack breizhjack/wrapper && \
    chmod o-r breizhjack/wrapper && \
    chmod +s breizhjack/wrapper && \
    chmod og-r breizhjack/flag.txt && \
    chown challenge: breizhjack/cards.txt

USER challenge

ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-e", "-f", "/opt/ssh/sshd_config" ]
