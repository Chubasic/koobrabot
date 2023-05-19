# FROM golang:1.20-alpine as builder
FROM quay.io/projectquay/golang:1.20 as builder
ARG TARGET_ARCH=amd64
ARG CMD
WORKDIR /go/src/app
COPY . .
RUN make ${CMD} TARGET_ARCH=${TARGET_ARCH}

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/koobrabot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/sll/certs/
ENTRYPOINT [ "./koobrabot", "start" ]