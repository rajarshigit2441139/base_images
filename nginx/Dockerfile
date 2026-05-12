FROM ghcr.io/rajarshigit2441139/base_images/alpine-3.22.0-arm64:23

WORKDIR /usr/src/nginx

RUN apk add --no-cache \
    nginx \
    pcre2 \
    gettext

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY docker-entrypoint.d/ /docker-entrypoint.d/

RUN chmod +x /docker-entrypoint.sh \
    && chmod +x /docker-entrypoint.d/*

RUN mkdir -p \
    /run/nginx \
    /var/cache/nginx/client_temp \
    /etc/nginx/templates

RUN rm -rf /usr/share/nginx/html/*

RUN chown -R nginx:nginx \
    /var/cache/nginx \
    /var/run \
    /var/log/nginx \
    /etc/nginx \
    /usr/share/nginx

USER nginx

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]