#!/usr/bin/env sh
#https://serverfault.com/questions/577370/how-can-i-use-environment-variables-in-nginx-conf
set -eu

#IP LOCALHOST
export LOCALHOST=$(ip route | awk '/^default via /{print $3}')

envsubst '${LOCALHOST} ${KIBANA_GUEST_AUTH} ${KIBANA_GUEST_PORT} ${DOMAIN_KIBANA} ${DOMAIN_ELASTIC} ${DOMAIN_JUPYTER} ${SERVER_NAME_KIBANA} ${SERVER_NAME_ELASTIC} ${SERVER_NAME_JUPYTER} ${KIBANA_PORT} ${ELASTIC_PORT} ${JUPYTER_PORT}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/nginx.conf
#echo "$@"

exec "$@"