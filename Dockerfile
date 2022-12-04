FROM golang:1.16

WORKDIR /app
COPY . .

RUN go build -o /bin/go-app

ENTRYPOINT ["/bin/go-app"]
EXPOSE 11130
