# Stage 1: Build stage with official Node.js Alpine image
FROM node:18.16.0-alpine AS builder

# Stage 2: Final image based on custom Alpine image
FROM ghcr.io/rajarshigit2441139/base_images/alpine-3.22.0-arm64:23

# Add Necessary Library
RUN apk add --no-cache libstdc++ libgcc gcompat

# Copy from Builder
COPY --from=builder /usr/local /usr/local

# Add Non-root User
RUN adduser -D nodeuser

# Setup Working Dir
WORKDIR /usr/src/node_app

# Change to Non-root user
USER nodeuser

# Default Command
CMD ["node", "--version"]