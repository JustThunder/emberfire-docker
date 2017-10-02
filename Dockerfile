FROM node:6-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

RUN apk add --no-cache git make gcc g++ openssl-dev openssl curl gnupg \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && curl -o- -L https://yarnpkg.com/install.sh | sh \
  && yarn config set spin false \
  && yarn global add bower ember-cli@2.15.1 firebase-tools phantomjs-prebuilt \
  && yarn cache clean \
  && apk del make gcc g++ openssl-dev
