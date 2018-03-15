#!/bin/bash
USER=`whoami`                                     # the user to run as
NUM_WORKERS=10
TIMEOUT=300
DJANGO_SETTINGS_MODULE="mysite.settings"          # which settings file should Django use
DJANGO_WSGI_MODULE="mysite.wsgi"                  # WSGI module name
echo "Starting as `whoami`"

# waiting for database start completely
sleep 3
cd /webapps
export DJANGO_SETTINGS_MODULE=mysite.settings
python3 manage.py makemigrations
python3 manage.py migrate

exec gunicorn ${DJANGO_WSGI_MODULE}:application  --workers $NUM_WORKERS  --bind 0.0.0.0:8000  --timeout $TIMEOUT   --log-level=info

