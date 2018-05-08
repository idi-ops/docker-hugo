FROM            alpine:3.7

ENV             HUGO_VERSION=0.40.2
ENV             HUGO_DOWNLOAD=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
RUN             wget -q -O - $HUGO_DOWNLOAD | tar xvz -C /
