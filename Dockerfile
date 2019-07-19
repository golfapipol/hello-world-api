FROM golang:1.12 as builder
WORKDIR /module
COPY ./go.mod /module/go.mod
RUN go mod download
COPY . /module
RUN CGO_ENABLED=0 GOOS=linux go build -o ./bin/app ./cmd

FROM alpine
WORKDIR /root/
COPY --from=builder /module/bin/app .
CMD ./app