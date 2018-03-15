#!/bin/bash
cd /webapps
export DJANGO_SETTINGS_MODULE=mysite.settings
python3 manage.py makemigrations
python3 manage.py migrate
uwsgi --ini uwsgi.ini
