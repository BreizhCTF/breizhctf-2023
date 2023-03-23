FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp:latest

USER root

COPY ./challenge /challenge/

RUN chmod +x /challenge/challenge

USER challenge

# ENV SOCAT_OPTIONS=""
