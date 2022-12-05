### Stage 1
FROM docker:19.03.0-dind
RUN apk update && apk add curl git
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl

### Stage 2
FROM golang:1.16-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o /bin/go-app
RUN apk add upx
RUN upx --ultra-brute /bin/go-app

### Stage 3
FROM scratch
COPY --from=builder /app/blog-app /bin/blog-app
ENTRYPOINT ["/bin/go-app"]
EXPOSE 11130




