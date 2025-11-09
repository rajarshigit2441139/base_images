# Use the Alpine base image for ARM64 architecture
FROM nginx:1.29-alpine AS nginx-stage

# Stage 2: Use your custom base image

# Use the Alpine base image for ARM64 architecture
FROM ghcr.io/rajarshigit2441139/base_images/alpine-3.22.0-arm64:23

# Copy Nginx binaries and configs from the nginx image
COPY --from=nginx-stage /etc/nginx /etc/nginx
COPY --from=nginx-stage /usr/sbin/nginx /usr/sbin/nginx
COPY --from=nginx-stage /usr/share/nginx /usr/share/nginx
COPY --from=nginx-stage /var/log/nginx /var/log/nginx

# Install necessary packages
RUN apk add --no-cache pcre2

# Create necessary folder
RUN mkdir -p /run/nginx
RUN mkdir -p /var/cache/nginx/client_temp

# Remove default content (optional)
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom nginx.conf
# COPY nginx.conf /etc/nginx/nginx.conf

# Create a non-root user and group for Nginx
RUN addgroup -S nginx && adduser -S -G nginx nginx

RUN chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx
USER nginx


# Expose Nginx port
# EXPOSE 8080

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
