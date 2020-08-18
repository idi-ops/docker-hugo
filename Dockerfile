FROM alpine:3.11 AS builder

ENV HUGO_VERSION=0.47.1
ENV HUGO_URL=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}

RUN apk add --no-cache  \
        ca-certificates \
        coreutils       \
        curl

RUN curl --remote-name-all --location                        \
         ${HUGO_URL}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
         ${HUGO_URL}/hugo_${HUGO_VERSION}_checksums.txt

RUN sha256sum --ignore-missing --check hugo_${HUGO_VERSION}_checksums.txt && \
    tar xvfzo hugo_${HUGO_VERSION}_Linux-64bit.tar.gz hugo


FROM alpine:3.11

COPY --from=builder /hugo /usr/local/bin/hugo

ONBUILD COPY    . /src
ONBUILD WORKDIR /src
ONBUILD RUN     hugo -v
