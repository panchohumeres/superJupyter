#### Based on:

amancevice docker-superset project:
    * https://hub.docker.com/r/amancevice/superset/
    * https://github.com/amancevice/docker-superset/tree/main/examples/postgres
    * https://github.com/amancevice/docker-superset

tylerFowler docker superset (set user example):
    * https://github.com/tylerFowler/docker-superset/blob/master/superset-init.sh


# SuperJupyter 
![enter image description here](./logo.png =50x50 )
## Business Intelligence Stack with Airbnb Apache Superset and Jupyter Notebooks
![enter image description here](arq.png)
Business Intelligence stack, based on **Apache Superset-PostGres** for **data warehousing** and **visualization**, and **Jupyter Notebooks** for development of automated **ETL** (Extract, Transform, Load) routines.

### Components:
 - **Apache Superset**: Airbnb Business Intelligence tool. Docker image based on amancevice docker-superset project:
    * https://hub.docker.com/r/amancevice/superset/
    * https://github.com/amancevice/docker-superset 
 - **PostgreSql**: Default Database for storing Superset metadata and other data (other connections to other databases can be added.) Based on amancevice docker-superset postgres example:
    * https://github.com/amancevice/docker-superset/tree/main/examples/postgres
 - **Jupyter Notebook**: Jupyter Container, derived from [Project Jupyter's Base Docker Image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html), supercharged with [Supercronic](https://github.com/aptible/supercronic) and [Papermill](https://papermill.readthedocs.io/en/latest/) for enabling the automatic scheduling of python 3 ETL scripts.
 - **Nginx:** Nginx service built from [Nginx official Docker image](https://hub.docker.com/_/nginx). Used for enabling **https** on Kibana and Jupyter endpoints, and Elasticsearch REST API.
 - **Certbot:** Custom docker container for configuration of **https** SSL certificates, and automating its renewal. Based on [nginx-certbot project](https://github.com/wmnnd/nginx-certbot)

### Dependencies
 - Docker and Docker-compose.
 - node.js
 - npm
 - elastic dump [see install instructions](https://www.npmjs.com/package/elasticdump) 

## Setup 
 1. Create `.env` file and populate environment variables.Follow structure outlined in the [example .env file](example.env)
 2. `./bi-init.sh`--->Create the folders and change permissions necessary for **SuperJupyter** startup.
 3. Register 2 domains, for the Jupyter and Superset endpoints,all pointing to your **server/VM IP**.
 4. Change accordingly the environment variables on the `.env` file.
 5. `./certbot.sh`--->Create the SSL certificates and keystores for enabling **https** on the Kibana and Jupyter endpoints, and the Elasticsearch REST API.

## Startup
 6. `docker-compose up`--->Start the stack
 7. `docker-compose up docker-compose_local.yaml`---->Start the stack in local mode (without nginx nor certbot, for testing in local environment).
 8. `docker-compose up --build`--->Start the stack recreating the services after changes in environment variables.

### Backup Utilities


## File Structure

Relevant File structure
```
📦EJK
┣ 📂CRONTAB
┃ ┣ 📂logs
┃ ┃Logs folder, where crontab status and output of Jupyter ETL scripts are stored.
┃ ┗ 📜crontab.sh
┃   Crontab script, which runs on Jupyter container at startup. Edit for configuration of ETL scheduling.
┣ 📂ETL
┃  ETL scripts (jupyter notebooks)
┣ 📂backup_utils
┃ ┣ 📂elastic_dump
┃ ┃  Elastic dump utility (node.js).
┃ ┗ 📂kibana
┃   Kibana backup utility (python3)
┣ 📂certs
┃  Docker-compose files for creating TSL certificates for internal communications between Elasticsearch-Kibana.
┣ 📂jupyter
┃   Jupyter configuration files, including Dockerfile.
┣ 📂modules
┃  Custom python modules and classes.
┣ 📂nginx
┃  Nginx configuration files, including Dockerfile.
┃ ┣ 📂conf
┃ ┃ ┣ 📜nginx-docker-entrypoint.sh
┃ ┃ ┃   Script executed at nginx container startup. It substitutes parameters from .env file in virtual server configuration file.
┃ ┃ ┗ 📜nginx.conf.template
┃     Virtual server configuration file.
┣ 📜bi-init.sh
┃   Stack setup script.
┣ 📜certbot.sh
┃    Certbot setup script.
┣ 📜docker-compose.yml
┃    Stack docker-compose file.
┣ 📜ebak.env
┃    .env file for elastic dump utility.
┣ 📜.env
┃    .env file for EJK stack docker-compose file.
┗ 📜elastic_backup.sh
    Wrapper for elastic dump utility.
```
