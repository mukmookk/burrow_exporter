FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /go/src/github.com/jirwin/burrow_exporter
COPY . .

RUN go mod tidy
RUN go build -o /go/bin/burrow-exporter burrow-exporter.go

FROM alpine

COPY --from=builder /go/bin/burrow-exporter /usr/local/bin/burrow-exporter

ENV BURROW_ADDR=http://localhost:8000
ENV METRICS_ADDR=0.0.0.0:8080
ENV INTERVAL=30
ENV API_VERSION=2

CMD ["burrow-exporter", "--burrow-addr", "$BURROW_ADDR", "--metrics-addr", "$METRICS_ADDR", "--interval", "$INTERVAL", "--api-version", "$API_VERSION"]