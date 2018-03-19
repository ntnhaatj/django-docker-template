# Simple DJango project using docker-compose

## Getting started

These instructions will deploy DJango project in production mode by docker.

Deployed system will contains below services:
* webapps (django)
* celery
* redis
* postgresql
* nginx

System architecture: (to be added)

## Prerequisites:

Below packages version are used for implementing this project:
* docker-ce: 17.12.0-ce
* docker-compose: 1.18.0

## Configuration

### Posgresql

The configuration of postgresql database is stored at ```./env/postgresql.env```. This env file will be loaded when running docker-compose.
```
$ cat env/postgresql.env
POSTGRES_PASSWORD=admin
POSTGRES_USER=admin
POSTGRES_DB=pollsdb
#POSTGRES_INITDB_ARGS=
#POSTGRES_INITDB_WALDIR=
#PGDATA=
```

### Nginx
The configuration of nginx proxy is stored at ```./nginx/webapps.conf```.

Certificates for nginx server should be stored at ```./nginx/certs/```.

**Notes: those configurations for nginx will be used when building nginx images by docker-compose.**

### Django
The configuration of django framework is stored at ```./env/webapps.env``` which is used for both ```webapps``` and ```celery``` services. This env file will be loaded when running docker-compose.
```
$ cat env/webapps.env
DJANGO_SETTINGS_MODULE=mysite.settings
DJANGO_WSGI_MODULE=mysite.wsgi
SECRET_KEY=7dc49*%r56elh!cdjql5ewn3=z1v4&_bqw1ic%-jspaa3uq!+)
DB_NAME=pollsdb
DB_USER=admin
DB_PASSWORD=admin
DB_HOST=db
DB_PORT=5432

# celery configuration
CELERY_BROKER_URL=redis://redis-server:6379
CELERY_RESULT_BACKEND=redis://redis-server:6379
CELERY_ACCEPT_CONTENT=application/json
CELERY_TASK_SERIALIZER=json
CELERY_RESULT_SERIALIZER=json
```

### Redis
```
//TODO:
// - flexibly adding user's redis.conf
//
```
## Deployment

* Build docker images

```
docker-compose build
```

* Deploy containers as daemon

```
docker-compose up -d
```

* Show containers log

```
docker-compose logs -f
```

## Contributing

## License
This project is licensed under the MIT License - see the LICENSE file for details
