# Use the Alpine base image for ARM64 architecture
FROM nginx:1.29-alpine AS nginx-stage

# Stage 2: Use your custom base image

# Use the Alpine base image for ARM64 architecture
FROM ghcr.io/rajarshigit2441139/base_images/alpine-3.22.0-arm64:23

# Set Working DIR
WORKDIR /usr/src/nginx

# Copy Nginx binaries and configs from the nginx image
COPY --from=nginx-stage /etc/nginx /etc/nginx
COPY --from=nginx-stage /usr/sbin/nginx /usr/sbin/nginx
COPY --from=nginx-stage /usr/share/nginx /usr/share/nginx
COPY --from=nginx-stage /var/log/nginx /var/log/nginx
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY docker-entrypoint.d/ /docker-entrypoint.d/

RUN chmod +x /docker-entrypoint.sh \
    && chmod +x /docker-entrypoint.d/*

# Install necessary packages
RUN apk add --no-cache pcre2 gettext

# Create necessary folder
RUN mkdir -p /run/nginx
RUN mkdir -p /var/cache/nginx/client_temp

# Remove default content (optional)
RUN rm -rf /usr/share/nginx/html/*

# Create a non-root user and group for Nginx
RUN addgroup -S nginx && adduser -S -G nginx nginx

RUN chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx
USER nginx


ENTRYPOINT ["/docker-entrypoint.sh"]

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
