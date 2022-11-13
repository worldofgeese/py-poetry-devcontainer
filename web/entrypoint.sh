#!/bin/sh

if [ "$DATABASE" = "cockroachdb" ]
then
  echo "Waiting for cockroachdb..."

  while ! nc -z $SQL_HOST $SQL_PORT; do
    sleep 0.1
  done

  echo "CockroachDB started"
fi

if [ "$FLASK_DEBUG" = 1 ]
then
    echo "Creating the database tables..."
    sleep 1
    python manage.py create_db
    echo "Tables created"
fi

exec "$@"