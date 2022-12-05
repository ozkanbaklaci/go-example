

### Stage 1
FROM ubuntu:18.04
ENV KUBERNETES_VERSION=v1.25.4
RUN set -x && \
    apt-get update && \
    apt-get install -y jq curl && \
    # Download and install kubectl
    [ -z "$KUBERNETES_VERSION" ] && KUBERNETES_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) ||: && \
    curl -s -LO https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client 

### Stage 2
FROM golang:1.16-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o /bin/go-app
RUN apk add upx
RUN upx --ultra-brute /bin/go-app

### Stage 3
FROM scratch
COPY --from=builder /bin/go-app /bin/go-app
ENTRYPOINT ["/bin/go-app"]
EXPOSE 11130




