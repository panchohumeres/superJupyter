#!/usr/bin/env sh
#https://serverfault.com/questions/577370/how-can-i-use-environment-variables-in-nginx-conf
set -eu

#IP LOCALHOST
export LOCALHOST=$(ip route | awk '/^default via /{print $3}')

envsubst '${LOCALHOST} ${DOMAIN_SUPERSET} ${DOMAIN_JUPYTER} ${SERVER_NAME_JUPYTER} ${SERVER_NAME_SUPERSET} ${JUPYTER_PORT} ${SUPERSET_PORT}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/nginx.conf
#echo "$@"

exec "$@"