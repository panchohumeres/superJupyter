FROM jupyter/base-notebook

USER root

RUN apt-get update
RUN apt-get -qq -y install curl
RUN apt-get install cron -yqq
RUN apt-get install -y rar unrar
#RUN apt-get install --assume-yes postfix


ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.9/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=5ddf8ea26b56d4a7ff6faecdd8966610d5cb9d85

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic


RUN python --version

USER $NB_UID

RUN conda install --quiet --yes -c \
    conda-forge pandas \
    pymongo \
    matplotlib \
    papermill \
    seaborn \
    sqlalchemy \
    scikit-learn \
    psycopg2 \
    boto3 \
    patool


RUN pip install -U elasticsearch


VOLUME /home/jovyan/work
WORKDIR /home/jovyan/work
