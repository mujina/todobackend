from base import * 
import os

if os.environ.get('DEBUG'):
  DEBUG = True
else: 
  DEBUG = False

# If debug disabled must set ALLOWED_HOSTS
ALLOWED_HOSTS = [os.environ.get('ALLOWED_HOSTS', '*')]

DATABASES = {
  'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': os.environ.get('MYSQL_DATABASE','todobackend'),
    'USER': os.environ.get('MYSQL_USER','todo'),
    'PASSWORD': os.environ.get('MYSQL_PASSWORD','password'),
    'HOST': os.environ.get('MYSQL_HOST','127.0.0.1'),
    'PORT': os.environ.get('MYSQL_PORT','3306'),
  }
}

STATIC_ROOT = os.environ.get('STATIC_ROOT', '/var/www/todobackend/static')
MEDIA_ROOT = os.environ.get('MEDIA_ROOT', '/var/www/todobackend/media')

