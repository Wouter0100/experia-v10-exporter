FROM golang:1.13.1 AS builder

RUN apt-get update && apt-get install -y upx

WORKDIR /build

ENV LD_FLAGS="-w"
ENV CGO_ENABLED=0

COPY go.mod go.sum /build/
RUN go mod download
RUN go mod verify

COPY . /build/
RUN echo "-- TEST" \
 && go test ./... \
 && echo "-- BUILD" \
 && go install -tags netgo -ldflags "${LD_FLAGS}" . \
 && echo "-- PACK" \
 && upx -9 /go/bin/experia-v10-exporter

FROM busybox
LABEL maintainer="Wouter van Os <wouter0100@gmail.com>"

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /go/bin/experia-v10-exporter /bin/experia-v10-exporter

USER nobody
EXPOSE 9205

ENTRYPOINT ["/bin/experia-v10-exporter"]