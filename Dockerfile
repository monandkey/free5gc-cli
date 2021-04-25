FROM golang:1.16.3-stretch as builder
LABEL MAINTAINER monandkey <satoru070505@gmail.com>

WORKDIR /go/src
RUN apt update -y \
    && apt install -y git

RUN git clone https://github.com/Srajdax/free5gc-cli.git \
    && cd free5gc-cli \
    && go mod download \
    && go build -ldflags="-s -w" -trimpath -o freecli5G -x freecli.go

FROM ubuntu:18.04 as runner

WORKDIR /free5gc-cli
COPY --from=builder /go/src/free5gc-cli/freecli5G ./
COPY --from=builder /go/src/free5gc-cli/config ./config

VOLUME [ "/free5gc-cli/config" ]

ENTRYPOINT [ "/free5gc-cli" ]
