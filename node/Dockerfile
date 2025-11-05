# Stage 1: Download and unpack Node.js
FROM alpine:3.22 AS downloader

RUN apk add --no-cache curl xz binutils && \
    curl -fsSLO "https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-arm64.tar.xz" && \
    tar -xJf "node-v18.16.0-linux-arm64.tar.xz" && \
    mv node-v18.16.0-linux-arm64 /node && \
    strip /node/bin/node && \
    rm -rf node-v18.16.0-linux-arm64.tar.xz /var/cache/apk/*

# Stage 2: Final minimal image
FROM ghcr.io/rajarshigit2441139/base_images/alpine-3.22.0-arm64:23

# Copy only the Node binary (no npm, no headers, no libs)
COPY --from=downloader /node/bin/node /usr/local/bin/node

# Create non-root user
RUN adduser -D nodeuser
# Working Dir
WORKDIR /usr/src/node_app
# Change User
USER nodeuser
# Default Command
CMD ["node", "--version"]


