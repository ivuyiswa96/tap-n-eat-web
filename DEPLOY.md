# 🚀 Deploy TapNEat Website on GitHub Pages

## Quick Setup (5 minutes)

### Step 1: Push to GitHub
```bash
git add .
git commit -m "Add TapNEat landing page"
git push origin main
```

### Step 2: Enable GitHub Pages
1. Go to **Settings** → **Pages**
2. Select **Source**: `Deploy from a branch`
3. Select **Branch**: `main`
4. Select **Folder**: `/docs`
5. Click **Save**

### Step 3: Get Your URL
Your site will be live at:
```
https://yourusername.github.io/Vibrant-Community-Marketplace-App
```

---

## 🎨 Customization

### Update Download Links

In `docs/index.html`, find this line (around line 281):
```html
<a href="https://github.com/yourusername/TapNEat/releases/download/v1.0/TapNEat.v1.apk" class="btn btn-android">
```

Replace with your actual APK download link. Options:

**Option A: GitHub Releases (FREE)**
```html
<a href="https://github.com/yourusername/your-repo/releases/download/v1.0/TapNEat.v1.apk">
```

**Option B: Direct File Link**
```html
<a href="https://example.com/path/to/TapNEat.v1.apk">
```

### Update Metadata

Edit `docs/_config.yml`:
```yml
title: TapNEat
description: Your custom description
url: https://yourusername.github.io/your-repo
```

---

## 📱 Mobile Testing

### Test Locally (Before deploying)
```bash
# Using Python (macOS/Linux)
cd docs
python -m http.server 8000

# Using Node.js
npx http-server docs
```

Then visit: `http://localhost:8000`

### Test on Your Phone
1. Share the localhost URL via QR code (use a QR generator)
2. Or test directly on GitHub Pages after deployment

---

## 🔗 Add iOS Link (When Ready)

Once GitHub Actions builds the iOS IPA:

1. Upload IPA to GitHub Releases
2. Replace the iOS button link:

```html
<a href="https://github.com/yourusername/repo/releases/download/v1.0/TapNEat.v1.ipa" class="btn btn-ios">
```

---

## 📊 Analytics (Optional)

Add Google Analytics to track downloads:

```html
<!-- Add before closing </head> -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

Replace `GA_MEASUREMENT_ID` with your Google Analytics ID.

---

## ✅ Deployment Checklist

- [ ] Updated `/docs/index.html` with correct APK link
- [ ] Updated `/docs/_config.yml` with your repo details
- [ ] Pushed changes to GitHub
- [ ] Enabled GitHub Pages in Settings
- [ ] Site is live at your GitHub Pages URL
- [ ] Download buttons work on mobile
- [ ] Tested on at least one phone device

---

## 🎯 Next Steps

1. **Add Social Media Sharing**: Add Open Graph meta tags
2. **Custom Domain**: Configure a custom domain in GitHub Pages settings
3. **Email Signup**: Add newsletter subscription form
4. **Analytics**: Track downloads with Google Analytics or Mixpanel
5. **SEO**: Submit sitemap to Google Search Console

---

## 📞 Support

For issues:
- Check GitHub Pages documentation: https://pages.github.com
- GitHub Pages troubleshooting: https://docs.github.com/en/pages
- Test mobile responsiveness: https://responsivedesignchecker.com

---

**Deployed Date**: 2026-03-07  
**Version**: v1.0
