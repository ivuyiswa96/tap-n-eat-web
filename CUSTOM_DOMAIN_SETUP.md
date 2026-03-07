# 🌐 Deploy TapNEat to tapneat.co.za

Your custom domain is ready! Here's how to point it to your GitHub Pages landing page.

## Option 1: GitHub Pages (Recommended - Free & Simple)

### Step 1: Push Code to GitHub
```powershell
cd "D:\Downloads\Vibrant Community Marketplace App"
git add docs/
git commit -m "Add custom domain configuration"
git push origin main
```

### Step 2: Configure DNS at Afrihost

1. **Log in to Afrihost Control Panel**
   - Go to: https://cpanel.afrihost.com/
   - Enter your credentials

2. **Find DNS Management**
   - Look for "DNS Zone Editor" or "DNS Management"
   - Find your domain: `tapneat.co.za`

3. **Add GitHub Pages DNS Records**

   Create these **A Records**:
   ```
   Name: @ (or tapneat.co.za)
   Type: A
   Points to: 185.199.108.153
   TTL: 3600
   
   Name: @ (or tapneat.co.za)
   Type: A
   Points to: 185.199.109.153
   TTL: 3600
   
   Name: @ (or tapneat.co.za)
   Type: A
   Points to: 185.199.110.153
   TTL: 3600
   
   Name: @ (or tapneat.co.za)
   Type: A
   Points to: 185.199.111.153
   TTL: 3600
   ```

   Create this **AAAA Record** (IPv6 - optional but recommended):
   ```
   Name: @
   Type: AAAA
   Points to: 2606:50c0:8000::153
   TTL: 3600
   
   Name: @
   Type: AAAA
   Points to: 2606:50c0:8001::153
   TTL: 3600
   
   Name: @
   Type: AAAA
   Points to: 2606:50c0:8002::153
   TTL: 3600
   
   Name: @
   Type: AAAA
   Points to: 2606:50c0:8003::153
   TTL: 3600
   ```

   **Optional - Add www subdomain**:
   ```
   Name: www
   Type: CNAME
   Points to: tapneat.co.za
   TTL: 3600
   ```

### Step 3: Enable Custom Domain on GitHub

1. Go to your GitHub repo
2. **Settings** → **Pages**
3. Scroll to "Custom domain"
4. Enter: `tapneat.co.za`
5. Click **Save**
6. Check "Enforce HTTPS" (wait for certificate)

### Step 4: Wait for DNS Propagation
- DNS usually propagates in 5-15 minutes
- Check status: https://dnschecker.org/#A/tapneat.co.za
- Your site goes live at: **https://tapneat.co.za**

---

## Option 2: Host on Afrihost (Alternative)

If you'd rather host directly on Afrihost's servers:

1. **FTP Upload** the `/docs` folder contents to `public_html/`
2. **Point DNS** to Afrihost's server (likely already done)
3. No GitHub involvement needed

---

## ✅ Verification Checklist

- [ ] DNS records added to Afrihost control panel
- [ ] Custom domain configured in GitHub Pages Settings
- [ ] Pushed code to GitHub (with CNAME file)
- [ ] DNS propagated (check dnschecker.org)
- [ ] Site loads at https://tapneat.co.za
- [ ] Android APK link points to correct URL
- [ ] Mobile responsive ✅
- [ ] HTTPS working ✅

---

## 🔗 Important URLs

After setup:
- **Landing Page**: https://tapneat.co.za
- **GitHub Repo**: https://github.com/yourusername/your-repo
- **Android Download**: https://tapneat.co.za (with download link inside)

---

## 🚨 DNS Propagation Issues?

If site doesn't load after DNS records are added:

1. **Check DNS records are saved**:
   ```bash
   nslookup tapneat.co.za
   # Should show: 185.199.108.153 or similar
   ```

2. **Clear browser cache**:
   - Press: Ctrl + Shift + Delete
   - Clear all browsing data

3. **Wait longer**:
   - DNS can take up to 48 hours in rare cases
   - Usually 5-15 minutes

4. **Test from different network**:
   - Try on mobile hotspot
   - Try from different WiFi

---

## 📝 Next Steps

1. ✅ Configure DNS at Afrihost
2. ✅ Enable custom domain on GitHub Pages
3. ✅ Update APK download link in HTML
4. ✅ Add Google Analytics (optional)
5. ✅ Test on mobile device
6. ✅ Share link: tapneat.co.za

---

**Domain**: tapneat.co.za  
**Status**: Ready to configure  
**Expires**: 6 Mar 2027  
**Hosting**: GitHub Pages (Free)

---

## 💡 Quick Reference: DNS Records

| Type | Name | Points To | TTL |
|------|------|-----------|-----|
| A | @ | 185.199.108.153 | 3600 |
| A | @ | 185.199.109.153 | 3600 |
| A | @ | 185.199.110.153 | 3600 |
| A | @ | 185.199.111.153 | 3600 |
| CNAME | www | tapneat.co.za | 3600 |

Save this for reference!
