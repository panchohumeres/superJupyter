#0 13 * * * papermill /home/jovyan/work/ETL/dashboards_gob/CKAN_to_elastic_encrypted.ipynb /home/jovyan/work/CRONTAB/logs/CKAN_to_elastic_encrypted_`date +\%Y\%m\%d\%H\%M\%S`.ipynb
0 */6 * * * papermill /home/jovyan/work/ETL/covid-chile.ipynb /home/jovyan/work/CRONTAB/logs/covid-chile_`date +\%Y\%m\%d\%H\%M\%S`.ipynb
20 */6 * * * papermill /home/jovyan/work/ETL/@perez.ipynb /home/jovyan/work/CRONTAB/logs/@perez_`date +\%Y\%m\%d\%H\%M\%S`.ipynb
23 */6 * * * papermill /home/jovyan/work/ETL/toS3.ipynb /home/jovyan/work/CRONTAB/logs/toS3_`date +\%Y\%m\%d\%H\%M\%S`.ipynb
26 */6 * * * papermill /home/jovyan/work/ETL/cleanETL.ipynb /home/jovyan/work/CRONTAB/logs/cleanETL_`date +\%Y\%m\%d\%H\%M\%S`.ipynb