FROM golang:latest as builder

COPY / /go/

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN go build \
    -a \
    -installsuffix nocgo \
    -o /tcp-to-stdout \
    main.go

FROM alpine:latest

ENV ADDR=:8080

EXPOSE 8080

RUN mkdir -p /srv
COPY --from=builder /tcp-to-stdout /srv/
WORKDIR /srv
CMD [ "/srv/tcp-to-stdout" ]
