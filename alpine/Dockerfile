FROM alpine:3.22.0

ARG maintainer="Rajarshi <rajarshi.official@gmail.com>"
ARG imagesource="https://gitlab.alpinelinux.org/alpine/aports"
ARG description="Base Alpine image"
ARG licenses="Apache-2.0"
ARG creator_github="https://github.com/rajarshigit2441139"
ARG version="1.0.0"

# Labels
LABEL org.opencontainers.image.source="${imagesource}"
LABEL org.opencontainers.image.description="${description}"
LABEL org.opencontainers.image.licenses="${licenses}"
LABEL org.opencontainers.image.created_by="${creator_github}"
LABEL org.opencontainers.image.version="${version}"
LABEL org.opencontainers.image.maintainer="${maintainer}"

# Install core packages
RUN apk add --no-cache ca-certificates curl bash

# Update the system certificate store
RUN update-ca-certificates

# NOTE: Docker COPY sources are relative to the build context (the directory
# passed to `docker build`). Using `../LICENSE` attempts to access files
# outside the build context and will fail. Expect to build from the
# `base_images` directory so `LICENSE` is in the context root and use
# `COPY LICENSE LICENSE` below.
COPY LICENSE /LICENSE

