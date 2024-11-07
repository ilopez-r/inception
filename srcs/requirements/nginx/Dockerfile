FROM debian:bullseye

RUN set -eux; \
  apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  nginx \
  openssl \
  vim \
  curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl
RUN openssl req -subj "/C=SP/ST=Malaga/L=Malaga/O=42Malaga/OU=ilopez-r/CN=ilopez-r.42.fr" -new -newkey rsa:2048 -days 365 -nodes -x509  -keyout /etc/nginx/ssl/ilopez-r.42.fr.key -out /etc/nginx/ssl/ilopez-r.42.fr.crt
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
