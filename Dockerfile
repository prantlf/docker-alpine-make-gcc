FROM alpine:3.15
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"
RUN apk --no-cache add make gcc g++ musl-dev binutils autoconf automake libtool pkgconfig check-dev file patch
