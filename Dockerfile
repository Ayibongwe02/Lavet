# Lavet Wellness: static storefront served by nginx (non-root).
FROM nginxinc/nginx-unprivileged:1.27-alpine

# Only the site itself goes into the image
COPY --chown=nginx:nginx *.html /usr/share/nginx/html/
COPY --chown=nginx:nginx css    /usr/share/nginx/html/css
COPY --chown=nginx:nginx js     /usr/share/nginx/html/js
COPY --chown=nginx:nginx images /usr/share/nginx/html/images

# nginx config template: ${PORT} is substituted at start-up
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

ENV PORT=8080 \
    NGINX_ENVSUBST_FILTER=PORT
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider "http://127.0.0.1:${PORT}/healthz" || exit 1
