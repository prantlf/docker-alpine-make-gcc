# prantlf/alpine-make-gcc

[Docker] image: Make, gcc, g++ and musl library for development on Alpine Linux

[![prantlf/alpine-make-gcc](http://dockeri.co/image/prantlf/alpine-make-gcc)](https://hub.docker.com/repository/docker/prantlf/alpine-make-gcc/)

[This image] is supposed to build C and C++ sources into an output usable on [Alpine Linux]. This image is built automatically on the top of the tag `latest` from the [Alpine repository], so that it is always based on the latest [Alpine Linux]. Packages `make`, `gcc`, `g++` and `musl-dev` have to be updated from time to time by triggering a new build manually.

## Tags

- [`latest`]
- [`3.12`]

## Install

```
docker pull prantlf/alpine-make-gcc
```

## Use

Typically, you will use this image as the first image in a multi-stage image build, for example:

    FROM prantlf/alpine-make-gcc:latest as builder
    RUN cd /root && \
        wget https://host/path/sources.tar.gz && \
        tar xf sources.tar.gz && \
        cd sources && \
        make

    FROM alpine:latest
    COPY --from=builder /root/sources/binary /usr/bin/

## Build, Test and Publish

The local image is built as `alpine-make-gcc` and pushed to the docker hub as `prantlf/alpine-make-gcc:3.12` and `prantlf/alpine-make-gcc:latest`.

Remove an old local image:

    make clean

Check the `Dockerfiles`:

    make lint

Build a new local image:

    make build

Enter an interactive shell inside the created image:

    make run

Login to the docker hub:

    make login

Push the local image to the docker hub:

    make push

## License

Copyright (c) 2020 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/alpine-make-gcc
[`latest`]: https://hub.docker.com/repository/docker/prantlf/alpine-make-gcc/tags
[`3.12`]: https://hub.docker.com/repository/docker/prantlf/alpine-make-gcc/tags
[Alpine repository]: https://hub.docker.com/_/alpine
[Alpine Linux]: https://alpinelinux.org/
