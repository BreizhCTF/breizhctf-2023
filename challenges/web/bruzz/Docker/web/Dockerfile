FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/python-flask

WORKDIR /challenge/

COPY src /challenge

RUN pip3 install -r requirements.txt

USER root
RUN chmod +x /challenge/server.py
USER nginx
