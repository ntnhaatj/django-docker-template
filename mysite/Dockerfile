FROM ubuntu:16.04

ENV APT_MIRROR http://opensource.xtdv.net/ubuntu
RUN sed -i "s|http://archive.ubuntu.com/ubuntu|${APT_MIRROR}|g" /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y python3 python3-pip

RUN mkdir /webapps
ADD requirements.txt /webapps
WORKDIR /webapps
RUN pip3 install -r requirements.txt

COPY . /webapps
RUN chmod a+x /webapps/run_webapps.sh
RUN chmod a+x /webapps/run_celery.sh
