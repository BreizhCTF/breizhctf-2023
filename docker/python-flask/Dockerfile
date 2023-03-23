FROM nginx:alpine

ENV TIMEZONE Europe/Paris

RUN apk add --no-cache sqlite py3-pip uwsgi-python3 && \
    pip install --upgrade pip flask

# RUN addgroup --gid 666 challenge && \
# 	adduser --uid 666 --disabled-password --home=/challenge --ingroup challenge challenge

# Add permissions
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Copie des fichiers de configuration
COPY ./uwsgi.ini /etc/uwsgi/
COPY ./nginx.conf /etc/nginx/
COPY ./start_uwsgi.sh /docker-entrypoint.d/

RUN chmod +x /docker-entrypoint.d/start_uwsgi.sh
RUN mkdir /run/uwsgi && chown -R nginx. /run/uwsgi


RUN mkdir /challenge && chown nginx: /challenge

USER nginx
WORKDIR /challenge/

EXPOSE 80
