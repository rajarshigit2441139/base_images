FROM alpine_base:1.0.0

LABEL maintainer="Rajarshi"
LABEL description="Node.js runtime based on Alpine base image"
LABEL version="1.0.0"

RUN apk add --no-cache nodejs npm

# Create non-root user
RUN adduser -D nodeuser

# Create Working Dir
WORKDIR /usr/src/node_app
# Change User
USER nodeuser
