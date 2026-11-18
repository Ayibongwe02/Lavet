FROM nginx:1.27-alpine
# Render injects $PORT (default 10000); nginx image templates it via envsubst at start-up
ENV PORT=10000
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY index.html /usr/share/nginx/html/index.html
COPY images /usr/share/nginx/html/images
EXPOSE 10000
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:${PORT}/healthz || exit 1
