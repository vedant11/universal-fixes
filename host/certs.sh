# if you do not need a trusted cert authority, you can generate a self-signed cert
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 # not recommended for production

# use certbot to get a cert from CA