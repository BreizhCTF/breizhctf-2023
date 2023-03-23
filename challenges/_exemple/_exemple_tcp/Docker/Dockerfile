FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp

USER root

RUN apt-get update && apt-get install --no-install-recommends -y python3 && rm -rf /var/lib/apt/lists/*

COPY app.py /challenge/challenge

RUN chmod +x /challenge/challenge

USER challenge
