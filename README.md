# prantlf/alpine-make-gcc

[Docker] image: Make, gcc, binutils, autoconf, musl and other tools for compiling packages on Alpine Linux

[This image] is supposed to build C and C++ sources into an output usable on [Alpine Linux]. This image is built automatically on the top of the tag `latest` from the [Alpine repository], so that it is always based on the latest [Alpine Linux]. Packages `make`, `gcc`, `g++`, `musl-dev`, `binutils`, `autoconf`, `automake`, `libtool`, `pkgconfig`, `check-dev`, `file` nad `patch` have to be updated from time to time by triggering a new build manually.

If you have trouble pulling the image from the Docker's default hub.docker.com, try gitlab.com, where [this project] is primarily maintained: `registry.gitlab.com/prantlf/docker-alpine-make-gcc`.

## Tags

- [`latest`], `3.16`, `3.15`, `3.14`, `3.13`, `3.12`

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

    # Remove an old local image:
    make clean
    # Check the `Dockerfiles`:
    make lint
    # Build a new local image:
    make build
    # Enter an interactive shell inside the created image:
    make run
    # Login to the docker hub:
    make login
    # Push the local image to the docker hub:
    make push

## License

Copyright (c) 2020-2022 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/alpine-make-gcc
[this project]: https://gitlab.com/prantlf/docker-alpine-make-gcc#prantlfalpine-make-gcc
[`latest`]: https://hub.docker.com/repository/docker/prantlf/alpine-make-gcc/tags
[Alpine repository]: https://hub.docker.com/_/alpine
[Alpine Linux]: https://alpinelinux.org/
