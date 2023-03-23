FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/tcp

USER root

RUN apt-get update && apt-get install --no-install-recommends -y python3-pip && rm -rf /var/lib/apt/lists/*

COPY --chown=challenge:challenge app.py /challenge/challenge
COPY flag.py /challenge/flag.py
COPY requirements.txt /challenge/requirements.txt

RUN pip3 install -r /challenge/requirements.txt

RUN chmod +x /challenge/challenge

USER challenge
