FROM ruby:2.6.0
MAINTAINER Chris Hirsch <chris@base2technology.com>

RUN apt-get update && \
    apt-get install -y rpm && \
    gem install fpm -v 1.11.0 && \
    gem install backports -v 3.15.0 && \
    apt-get clean all
RUN useradd fpm
USER fpm
WORKDIR /src

CMD [ "fpm" ]
