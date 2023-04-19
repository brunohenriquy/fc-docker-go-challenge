FROM golang:alpine as base

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=off

RUN go build -o /fc-docker-go-challenge .

FROM scratch

COPY --from=base /fc-docker-go-challenge .

CMD ["./fc-docker-go-challenge"]