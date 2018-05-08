# docker-hugo

Docker image for the Hugo static site generator

## Generate website

 You need to mount the `/src` directory as Docker volumes so Hugo inside the container has access to your code and to write the artifacts:

```
$ docker run --rm -ti -v $PWD:/src inclusivedesign/hugo --destination=/src
```

## Watch for changes

```
$ docker run --rm -ti -P -v $PWD:/src inclusivedesign/hugo server 
```

Your website will be available on http://localhost:1313
