# syntax = docker/dockerfile:experimental

FROM golang:1.11.5-alpine

RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go \
    --mount=type=bind,target=. \
    CGO_ENABLED=0 go build -ldflags '-d -w -s' -o /bin/app

ENTRYPOINT ["/bin/app"]
