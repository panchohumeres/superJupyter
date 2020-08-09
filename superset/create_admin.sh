#!/usr/bin/env bash  

set -eu

export FLASK_APP=superset

/usr/local/bin/flask fab create-admin \
    --username $ADMIN_USERNAME \
    --firstname $ADMIN_FIRST_NAME \
    --lastname $ADMIN_LAST_NAME \
    --email $ADMIN_EMAIL \
    --password $ADMIN_PWD\

superset init