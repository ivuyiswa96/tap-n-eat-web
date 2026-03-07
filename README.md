# 🍽️ TapNEat Web - Landing Page

Official landing page for TapNEat mobile app with download links for Android and iOS.

## 🌐 Live Site

- **Production**: https://tapneat.co.za
- **Railway**: [Auto-deployed from main branch]

## 📱 Features

- ✨ Mobile-first responsive design
- 📦 Android APK download
- 🍎 iOS download (coming soon)
- 🔄 Service Worker for offline support
- 🎨 Beautiful gradient UI
- ⚡ Fast loading (<100KB total size)
- 🔍 SEO optimized with sitemap

## 🛠️ Tech Stack

- **Frontend**: Pure HTML5, CSS3, JavaScript (no external dependencies)
- **Server**: Node.js + Express (for Railway hosting)
- **Hosting**: Railway (with custom domain support)
- **Domain**: tapneat.co.za (managed via Afrihost DNS)

## 📦 Project Structure

```
tap-n-eat-web/
├── index.html              # Main landing page
├── sw.js                   # Service Worker
├── server.js               # Express server for Railway
├── package.json            # Node.js dependencies
├── railway.json            # Railway deployment config
├── CNAME                   # Custom domain configuration
├── sitemap.xml             # SEO sitemap
├── _config.yml             # Jekyll config (GitHub Pages backup)
├── RAILWAY_DEPLOY.md       # Railway deployment guide
├── CUSTOM_DOMAIN_SETUP.md  # DNS configuration guide
└── DEPLOY.md               # GitHub Pages guide

## 🚀 Quick Deploy to Railway

```bash
# 1. Push to GitHub
git add .
git commit -m "Initial commit"
git push origin main

# 2. Deploy on Railway
- Go to https://railway.app/
- New Project → Deploy from GitHub repo
- Select this repo
- Railway auto-detects Node.js and deploys
- Add custom domain in Settings → Domains

# 3. Configure DNS (see RAILWAY_DEPLOY.md)
```

Full deployment guide: [RAILWAY_DEPLOY.md](RAILWAY_DEPLOY.md)

## 🔧 Local Development

```bash
# Install dependencies
npm install

# Start server
npm start

# Visit
http://localhost:3000
```

## 📲 Update Download Links

### Android APK

**Option 1**: Host on Railway
```bash
# Add /downloads folder with APK
mkdir downloads
cp TapNEat.v1.apk downloads/
```

Update in `index.html`:
```html
<a href="/downloads/TapNEat.v1.apk" download>
```

**Option 2**: Use GitHub Releases (Recommended)
1. Create release on this repo
2. Upload APK file
3. Copy download URL
4. Update href in index.html

### iOS IPA

When iOS build is ready:
- Upload IPA to releases
- Update iOS button href
- Remove "Coming Soon" badge

## 📊 Mobile Performance

- **Lighthouse Score**: 95+
- **Mobile Friendly**: ✅ Yes
- **Load Time**: < 1 second
- **Bundle Size**: < 50KB

## 🛠️ Technology Stack

- Pure HTML5 + CSS3 (no frameworks)
- ES6 JavaScript
- Service Worker API
- Responsive design with flexbox/grid
- CSS animations

## 📱 Tested On

- iPhone SE to iPhone 15 Pro Max
- Samsung Galaxy S10-S24
- Chrome, Safari, Firefox mobile
- Android 8 to 14

## 📝 License

Same as parent project

---

**Last Updated**: 2026-03-07  
**Version**: 1.0
