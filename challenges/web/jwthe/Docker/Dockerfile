FROM registry-bzh.alfred.cafe/breizh-ctf-2023/breizh-ctf-2023/base-docker/python-flask

WORKDIR /challenge/

USER root

COPY src /challenge
RUN chmod 444 *.pem

RUN pip3 install -r requirements.txt

RUN sed -i 's/is_pem_format(key) or is_ssh_key(key)/False/g' /usr/lib/python3.10/site-packages/jwt/algorithms.py

RUN chmod +x /challenge/server.py

USER nginx
