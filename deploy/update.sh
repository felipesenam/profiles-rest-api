#!/usr/bin/env bash

set -e

PROJECT_BASE_PATH='/usr/local/apps/profiles-rest-api'
VIRTUALENV_BASE_PATH='/usr/local/virtualenvs'
VIRTUALENV_NAME='profiles_api'

cd $PROJECT_BASE_PATH
git pull
$VIRTUALENV_BASE_PATH/$VIRTUALENV_NAME/bin/python manage.py migrate
$VIRTUALENV_BASE_PATH/$VIRTUALENV_NAME/bin/python manage.py collectstatic --noinput
supervisorctl restart profiles_api

echo "DONE! :)"
