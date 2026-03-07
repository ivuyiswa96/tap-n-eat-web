# Deploy TapNEat Static Site

This repository is static-only. You do not need Node.js or npm to deploy it.

## GitHub Pages

- Push the repository to GitHub.

```bash
git add .
git commit -m "Deploy static TapNEat site"
git push origin main
```

- In GitHub: `Settings` -> `Pages`.
- Set `Source` to `Deploy from a branch`.
- Select branch `main` and folder `/ (root)`.
- Save.

Your site will publish at your GitHub Pages URL, or at your custom domain if configured.

## Custom Domain

- `CNAME` already contains `tapneat.co.za`.
- Configure DNS as described in `CUSTOM_DOMAIN_SETUP.md`.

## What Gets Hosted

- `index.html`
- `sw.js`
- `downloads/TapNEat.apk`
- `downloads/latest.json`
- `sitemap.xml`

## Local Testing

Option 1: Open `index.html` directly in your browser.

Option 2: Run a lightweight static server (optional):

```bash
python -m http.server 8080
```

Then open `http://localhost:8080`.

## Release Checklist

- [ ] Replace `downloads/TapNEat.apk` with the latest APK
- [ ] Update `downloads/latest.json`
- [ ] Push to `main`
- [ ] Confirm Android download works
- [ ] Confirm HTTPS works on `tapneat.co.za`
