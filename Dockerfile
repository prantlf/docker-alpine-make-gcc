FROM alpine:latest
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"
RUN apk --no-cache add make gcc g++ musl-dev
