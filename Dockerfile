FROM node:20-alpine
WORKDIR /app
COPY server.js .
COPY index.html public/index.html
COPY privacy-policy.html public/privacy-policy.html
COPY sw.js public/sw.js
COPY sitemap.xml public/sitemap.xml
COPY downloads/latest.json public/downloads/latest.json
EXPOSE 8080
CMD ["node", "server.js"]
