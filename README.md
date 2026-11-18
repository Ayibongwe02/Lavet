# Lavet Wellness — E-commerce Prototype

Multi-page prototype storefront for **Lavet Wellness** (natural supplements, skincare & rituals).

Built for client demos and marketing. No backend, no database, no real payments.

## Pages

| Page | Path | Description |
|------|------|-------------|
| Home | `index.html` | Neon 3D/4D hero product, featured products, loading + onboarding overlays |
| Shop | `products.html` | Full catalog with category filters |
| Product | `product.html?id=N` | Product detail + add to cart |
| Cart | `cart.html` | Cart management (localStorage) |
| Checkout | `checkout.html` | Demo shipping & payment form |
| Order complete | `order-complete.html` | Prototype “order placed” confirmation |
| About | `about.html` | Brand story |
| Contact | `contact.html` | Demo contact form |
| Account | `account.html` | Placeholder sign-in / register / orders |

## Features

- **Neon 3D/4D hero product** — The Lavet dropper bottle drawn as a glowing line structure inside a rotating 4D tesseract. Follows the cursor (3D tilt + 4D fold), drag to spin, gold / white toggle. Dependency-free canvas, works offline.
- **Neon loading overlay** — The same bottle builds itself base-to-bulb while the page loads. Shows once per session; add `?loader` to the URL to replay it for demos.
- **Onboarding** — First-visit welcome modal explaining the prototype
- **Cart** — Add / update / remove items, persisted in `localStorage`
- **Checkout flow** — Full path to a clear “this is not a real payment” success page
- **Account placeholders** — Sign-in, register, order history UI with no real auth
- **Responsive** — Works on mobile and desktop
- **Dark mode** — Respects `prefers-color-scheme`
- **Original branding** — Earthy palette, product images and ZAR pricing from the brochure

## Run locally

Open any HTML file in a browser, or serve the folder:

```bash
# Python
python3 -m http.server 8080

# Node
npx serve .

# Then visit http://localhost:8080
```

## Products

Product data lives in `js/products.js`. Images are in `images/products/`.

## Notes for production

To turn this into a live store you would typically add:

- Backend / headless CMS or Shopify / WooCommerce
- Real authentication and customer accounts
- Payment gateway (PayFast, Yoco, Stripe, etc.)
- Inventory and order management
- Email transactional system

This prototype intentionally stops short of those so you can show the experience without infrastructure.

## Neon product — files & tuning

| File | Purpose |
|------|---------|
| `js/neon-product.js` | Renderer + geometry (bottle lathe profile, tesseract). Palettes live in `PALETTES` at the top. |
| `js/neon-stage.js` | Hero wiring: starts the scene, colour toggle (remembered in `localStorage`). |
| `js/neon-loader.js` | Loading overlay: progress, minimum duration (`MIN_MS`), once-per-session logic. |

- **Swap the product shape:** edit the `P(radius, y)` profile points in `buildGeometry()`.
- **Respects `prefers-reduced-motion`** (no auto-spin or sway; loader shortens to ~1s).
- The overlay is on `index.html` only. To use it on other pages, copy the head guard script, the `#neon-loader` markup, and the three script tags.
