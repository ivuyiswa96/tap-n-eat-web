const express = require('express');
const path = require('path');
const app = express();

const PORT = process.env.PORT || 3000;

// Serve static files from current directory
app.use(express.static(__dirname));

// Handle service worker
app.get('/sw.js', (req, res) => {
  res.setHeader('Content-Type', 'application/javascript');
  res.sendFile(path.join(__dirname, 'sw.js'));
});

// Serve APK with correct MIME type
app.get('/downloads/TapNEat.apk', (req, res) => {
  res.setHeader('Content-Type', 'application/vnd.android.package-archive');
  res.setHeader('Content-Disposition', 'attachment; filename="TapNEat.apk"');
  res.sendFile(path.join(__dirname, 'downloads', 'TapNEat.apk'));
});

// Serve metadata with no-cache
app.get('/downloads/latest.json', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');
  res.sendFile(path.join(__dirname, 'downloads', 'latest.json'));
});

// Fallback to index.html for all other routes
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 TapNEat landing page server running on port ${PORT}`);
  console.log(`📱 Accessible at http://0.0.0.0:${PORT}`);
});

