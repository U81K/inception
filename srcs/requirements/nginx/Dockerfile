FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl && mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
COPY conf/my.conf  /etc/nginx/conf.d/configfile.conf	


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]