FROM node:6-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

RUN apk add --no-cache git make gcc g++ openssl-dev openssl curl bash gnupg \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && curl -o- -L https://yarnpkg.com/install.sh | bash \
  && yarn config set spin false \
  && yarn global add bower ember-cli firebase-tools phantomjs-prebuilt \
  && yarn cache clean \
  && apk del make gcc g++ openssl-dev
