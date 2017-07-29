FROM node:6-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

RUN apk add --no-cache git make gcc g++ openssl-dev openssl \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && npm config set spin false \
  && npm install -g bower ember-cli firebase-tools phantomjs-prebuilt \
  && apk del make gcc g++ openssl-dev
