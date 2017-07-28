FROM node:6-alpine

RUN apk add --no-cache git make gcc g++ openssl-dev \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && npm config set spin false \
  && npm install -g bower ember-cli firebase-tools phantomjs-prebuilt \
  && apk remove make gcc g++ openssl-dev
