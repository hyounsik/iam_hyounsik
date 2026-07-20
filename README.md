# hyounsik.info

- https://hyounsik.info
- Next.js (App Router, static export) + Tailwind CSS
- Firebase Hosting

## Development

```bash
npm install
npm run dev
```

## Build & Deploy

`next build` produces a static export in `out/`, which Firebase Hosting serves directly (no SSR/server).

```bash
npm run build
firebase deploy --only hosting
```
