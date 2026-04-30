#!/bin/sh
sed -i "s/PORT/${PORT:-80}/g" /etc/nginx/nginx.conf
exec nginx -g "daemon off;"
