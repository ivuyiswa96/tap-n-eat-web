FROM nginx:alpine

COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD sh -c "sed -i 's/PORT/'"$PORT"'/g' /etc/nginx/nginx.conf && nginx -g 'daemon off;'"
