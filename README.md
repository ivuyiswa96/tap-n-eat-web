# TapNEat Web - Static Landing Page

Official static landing page for TapNEat mobile app downloads.

## Live Site

- Production: [https://tapneat.co.za](https://tapneat.co.za)

## Features

- Mobile-first responsive design
- Android APK download from `downloads/TapNEat.apk`
- iOS button placeholder (coming soon)
- Service Worker offline cache support
- SEO files included (`sitemap.xml`, `CNAME`, `_config.yml`)

## Stack

- HTML5 + CSS3 + vanilla JavaScript
- No Node.js runtime
- No backend server

## Project Structure

```text
tap-n-eat-web/
|-- index.html
|-- sw.js
|-- CNAME
|-- sitemap.xml
|-- _config.yml
|-- CUSTOM_DOMAIN_SETUP.md
|-- DEPLOY.md
`-- downloads/
    |-- TapNEat.apk
    |-- latest.json
    `-- apk/
```

## Local Preview (No Node.js)

Option 1 (recommended): open `index.html` directly in your browser.

Option 2 (better Service Worker behavior): use any simple static file server, for example:

```bash
python -m http.server 8080
```

Then visit `http://localhost:8080`.

## Deployment

Use any static host:

- GitHub Pages
- Netlify
- Cloudflare Pages
- Static hosting on your domain provider

Detailed steps: see `DEPLOY.md` and `CUSTOM_DOMAIN_SETUP.md`.

## Updating APK

1. Replace `downloads/TapNEat.apk` with the latest build.
2. Update `downloads/latest.json` version metadata.
3. Commit and deploy.

## License

Same as parent project.
