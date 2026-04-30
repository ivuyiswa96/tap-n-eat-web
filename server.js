const http = require('http');
const fs = require('fs');
const path = require('path');
const PORT = parseInt(process.env.PORT) || 3000;
const ROOT = path.join(__dirname, 'public');
const MIME = { '.html':'text/html','.js':'application/javascript','.css':'text/css','.json':'application/json','.xml':'application/xml','.ico':'image/x-icon','.svg':'image/svg+xml' };
http.createServer((req, res) => {
  let f = path.join(ROOT, req.url === '/' ? 'index.html' : req.url);
  if (!path.extname(f)) f += '.html';
  fs.readFile(f, (err, data) => {
    if (err) { res.writeHead(404); res.end('Not found'); return; }
    res.writeHead(200, {'Content-Type': MIME[path.extname(f)] || 'application/octet-stream'});
    res.end(data);
  });
}).listen(PORT, '0.0.0.0', () => process.stdout.write('Listening on ' + PORT + '\n'));