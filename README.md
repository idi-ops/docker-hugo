# docker-hugo

![CI](https://github.com/idi-ops/docker-hugo/workflows/Docker%20Image%20Push/badge.svg)

Docker image for the Hugo static site generator

## Use as base image

The `hugo` image has these commands:

```
ONBUILD COPY    . /src
ONBUILD WORKDIR /src
ONBUILD RUN     hugo
```

You can just use it and the site will be generated automatically on build:

```
FROM inclusivedesign/hugo as builder

FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
```

## Generate website

 You need to mount the `/src` directory as Docker volumes so Hugo inside the container has access to your code and to write the artifacts:

```
$ docker run --rm -ti -v $PWD:/src inclusivedesign/hugo --destination=/src
```

## Watch for changes

```
$ docker run --rm -ti --publish-all -v $PWD:/src inclusivedesign/hugo server --destination=/src
```

Your website will be available on http://localhost:1313
