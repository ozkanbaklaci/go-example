FROM golang:1.16-alpine AS builder

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o /app/blog-app

### Stage 2
FROM scratch
COPY --from=builder /app/go-app /bin/go-app
ENTRYPOINT ["/bin/go-app"]




