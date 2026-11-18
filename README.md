# Lavet Wellness – prototype storefront

Static catalog served by nginx in Docker.

## Run locally
    docker compose up --build      # http://localhost:8080
    # or: docker build -t lavet . && docker run -p 8080:10000 lavet

## Deploy on Render
1. Push this folder to a GitHub/GitLab repo.
2. Render → New → Blueprint → select the repo (reads `render.yaml`),
   or New → Web Service → Runtime: Docker.
3. Health check path: `/healthz`. No env vars needed (Render sets `PORT`).

## Edit products
Products live in the `PRODUCTS` array in `index.html`; photos are in `images/products/`.
