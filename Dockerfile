FROM python:alpine

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/requirements.txt
RUN apk add --no-cache postgresql-libs gcc postgresql-dev musl-dev linux-headers libffi-dev
RUN export CFLAGS=-Wunused-argument && \
    export CPPFLAGS=-Wunused-argument && \
    pip install --no-cache-dir -r requirements.txt

ADD . /code/
