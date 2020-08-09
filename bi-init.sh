#!/bin/bash

set -a
. ./.env
set +a

echo "creating certs dir: "${HOST_DATA_PATH}"/certs"
mkdir ${HOST_DATA_PATH}/certs
echo "creating certbot dir"
mkdir ${CERTBOT_PATH}
echo "changing ownership of certbot dir (for docker execution)"
sudo chmod -R g+rwx ${CERTBOT_PATH}
sudo chgrp -R 1000 ${CERTBOT_PATH}
sudo chown -R 1000 ${CERTBOT_PATH}


#CREATE CERTIFICATES FOR INTERNAL ELASTICSEARCH-KIBANA COMMUNICATION (TSL LAYER)
#echo "creating certificates for TSL internal layer of stack"
#docker-compose -f ./certs/create-certs.yml run --rm create_certs

#echo "changing ownership of certificates files (for docker execution)"


sudo chmod -R g+rwx ${HOST_DATA_PATH}
sudo chgrp -R 1000 ${HOST_DATA_PATH}
sudo chown -R 1000 ${HOST_DATA_PATH}