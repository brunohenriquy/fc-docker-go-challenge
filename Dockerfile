FROM golang:alpine as base

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=off

RUN go build -o fc-docker-go-challenge

FROM scratch

WORKDIR /app

COPY --from=base /app /app

CMD ["./fc-docker-go-challenge"]