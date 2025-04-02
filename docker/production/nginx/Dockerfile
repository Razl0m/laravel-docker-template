FROM alpine:3.21.3 AS builder

RUN apk add --no-cache \
    curl \
    nodejs \
    npm

WORKDIR /var/www

COPY . /var/www

RUN npm install && npm run build

FROM nginx:1.27.4-alpine3.21-slim

COPY ./docker/production/nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /var/www/public /var/www/public

WORKDIR /var/www/public

EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
