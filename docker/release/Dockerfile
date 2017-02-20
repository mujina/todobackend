FROM pugme/todobackend-base:latest

MAINTAINER Mike Kirk <mujina@pugme.co.uk>

ENV TERM=xterm-256color

COPY target /wheelhouse

RUN . /appenv/bin/activate && \
    pip install --no-index -f /wheelhouse todobackend && \
    rm -rf /wheelhouse
