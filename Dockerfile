FROM golang:1.12.4 AS Builder
WORKDIR /helloworld
COPY helloworld.go .
RUN GOOS=linux go build -a -installsuffix cgo -o helloworld .

FROM alpine:latest
WORKDIR /root

COPY --from=Builder /helloworld/helloworld .

CMD ["./helloworld"]
