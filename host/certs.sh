# if you do not need a trusted cert authority, you can generate a self-signed cert
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 # not recommended for production

# use certbot to get a cert from CA
sudo certbot certonly --standalone --agree-tos --email your_email@example.com -d domainname # have to manually configure the cert

# renew automatically
0 12 * * * /usr/bin/certbot renew --quiet # in crontab
