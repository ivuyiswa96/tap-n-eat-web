# Railway Deployment Guide for TapNEat Landing Page

## Quick Setup (5 minutes)

### Step 1: Push Code to GitHub

```bash
git add docs/
git commit -m "Add Railway server configuration"
git push origin main
```

### Step 2: Deploy to Railway

1. **Go to Railway**: https://railway.app/
2. **Sign up/Login** with GitHub account
3. **Create New Project**:
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository
   - Select the `main` branch
4. **Configure Root Directory**:
   - In Railway dashboard → Settings
   - Set **Root Directory**: `docs`
   - This tells Railway to deploy only the /docs folder
5. **Deploy**:
   - Railway will automatically detect Node.js project
   - It will run `npm install` and `npm start`
   - Wait 2-3 minutes for first deployment

### Step 3: Get Railway Domain

After deployment completes:
1. Go to Settings → Domains
2. You'll see a generated Railway domain like: `tapneat-production-xxxx.up.railway.app`
3. **Test it**: Visit the URL to see your landing page

### Step 4: Add Custom Domain (tapneat.co.za)

#### In Railway:
1. Go to Settings → Domains
2. Click "Custom Domain"
3. Enter: `tapneat.co.za`
4. Railway will show you DNS records to add

#### In Afrihost DNS:
1. **Delete old GitHub A records** (if you added them)
2. **Add CNAME record**:
   - Type: `CNAME`
   - Name: `@` (for root domain)
   - Value: `tapneat-production-xxxx.up.railway.app` (your Railway domain)
   - TTL: `3600`

3. **Optional - Add www subdomain**:
   - Type: `CNAME`
   - Name: `www`
   - Value: `tapneat-production-xxxx.up.railway.app`
   - TTL: `3600`

### Step 5: Verify

1. **Wait 5-15 minutes** for DNS propagation
2. **Test your domain**: https://tapneat.co.za
3. **Check DNS**: https://dnschecker.org/#CNAME/tapneat.co.za

---

## Alternative: CNAME Flattening for Root Domain

If Afrihost doesn't support CNAME for root domain (@):

### Option A: Use ALIAS/ANAME Record
Some DNS providers offer ALIAS or ANAME records (works like CNAME for root):
- Type: `ALIAS` or `ANAME`
- Name: `@`
- Value: `tapneat-production-xxxx.up.railway.app`

### Option B: Use www as Primary
Point www to Railway, then redirect @ → www:
1. CNAME: `www` → Railway domain
2. HTTP redirect: `tapneat.co.za` → `www.tapneat.co.za` (setup in Afrihost)

### Option C: Use Railway's IP (if provided)
Railway may provide a static IP in custom domain settings:
- Type: `A`
- Name: `@`
- Value: Railway's IP address

---

## Update APK Download Link

After deployment, update the Android download link in `index.html`:

**Option 1: Host on Railway**
Upload `TapNEat.v1.apk` to `/docs/downloads/` folder:
```html
<a href="/downloads/TapNEat.v1.apk" download>
```

**Option 2: Use GitHub Releases** (Recommended)
1. Go to GitHub → Releases → Create New Release
2. Upload `TapNEat.v1.apk`
3. Copy download link
4. Update href in index.html

---

## Environment Variables (if needed)

In Railway Settings → Variables, you can add:
```
NODE_ENV=production
PORT=3000
```

Railway automatically sets PORT, so you typically don't need to add it.

---

## Deployment Commands

**Deploy specific branch:**
- Railway auto-deploys when you push to `main`

**Manual redeploy:**
- Go to Deployments → Click "Redeploy"

**View logs:**
- Go to Deployments → Click on deployment → View Logs

---

## Cost

**Railway Free Tier:**
- $5 credit/month (enough for small landing page)
- 500 hours/month (more than enough for 1 service)
- After free tier: ~$0.000231/GB-hour

**Estimated cost for landing page:** $0-5/month

---

## Monitoring

**Check deployment status:**
- Railway Dashboard → Deployments
- Look for green "Success" status

**View live logs:**
```bash
# Install Railway CLI (optional)
npm install -g @railway/cli

# Login and view logs
railway login
railway logs
```

---

## Troubleshooting

### Deployment Failed
- Check logs in Railway dashboard
- Ensure `package.json` has correct start script
- Verify Node version >= 18

### Custom Domain Not Working
- Verify CNAME record in Afrihost DNS
- Check DNS propagation: dnschecker.org
- Ensure Railway shows "Domain Active" status
- Wait up to 24 hours for full propagation

### 404 Errors
- Verify Root Directory is set to `docs`
- Check that server.js exists and has correct path
- Redeploy from Railway dashboard

---

## Next Steps

1. ✅ Deploy to Railway
2. ✅ Add custom domain tapneat.co.za
3. 🔄 Update APK download link
4. 🔄 Test on mobile devices
5. 🔄 Build iOS version with GitHub Actions
6. 🔄 Add iOS download link

---

## Support

- Railway Docs: https://docs.railway.app
- Railway Discord: https://discord.gg/railway
- Afrihost Support: https://www.afrihost.com/support
