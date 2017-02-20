FROM pugme/todobackend-base:latest

MAINTAINER Mike Kirk <mujina@pugme.co.uk>

ENV TERM=xterm-256color

# Could set local mirror


RUN apt-get update && \
    apt-get install -qy python-dev libmysqlclient-dev

RUN . /appenv/bin/activate && \
    pip install wheel --upgrade 

ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PIP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache

# For artifacts - python wheels
VOLUME /wheelhouse

# Build cache to keep test and build consistent
VOLUME /build

VOLUME /reports

COPY scripts/test.sh /usr/local/bin/test.sh

RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["test.sh"]
CMD ["python", "manage.py", "test", "--noinput"]

COPY src /application
WORKDIR /application
