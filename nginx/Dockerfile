FROM nginx:1.15-alpine

RUN apk add curl

RUN apk add nano

RUN apk add openrc

RUN apk add --update bash

#SHELL ["/bin/bash", "-c"]

ENTRYPOINT ["/etc/nginx/conf.d/nginx-docker-entrypoint.sh"]


