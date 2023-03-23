FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp

USER root

RUN apt-get update \
  && apt-get install --no-install-recommends -y python3 python3-pip \
  && rm -rf /var/lib/apt/lists/*

COPY dataset.db model.py requirements.txt /challenge/
COPY app.py /challenge/challenge

RUN pip3 install --no-cache-dir -r /challenge/requirements.txt \
  && chmod +x /challenge/challenge

USER challenge
