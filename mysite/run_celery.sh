#!/bin/bash
USER=`whoami`                                     # the user to run as
NUM_WORKERS=10
TIMEOUT=300
echo "Starting as `whoami`"

# waiting for webapps start completely
sleep 6
cd /webapps
python3 manage.py makemigrations
python3 manage.py migrate

exec celery -A mysite worker -l info
