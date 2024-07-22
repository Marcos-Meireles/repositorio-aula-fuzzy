#!/bin/sh

# O shell irá encerrar a execução do script quando encontrar um erro
set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  echo " 🟡 Aguardando o banco de dados estar disponível ($POSTGRES_HOST $POSTGRES_PORT) ..."
  sleep 1
done

echo "✅ Banco de dados disponível! ($POSTGRES_HOST $POSTGRES_PORT)"

python manage.py collectstatic --noinput
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py runserver 0.0.0.0:8000