```sh
sudo apt update && sudo apt upgrade -y && sudo apt install nginx python3-certbot-nginx -y
sudo vi /etc/nginx/sites-available/domain.tld.conf
ln -s /etc/nginx/sites-available/domain.tld.conf /etc/nginx/sites-enabled/domain.tld.conf
sudo service nginx restart
sudo certbot --nginx -d subdomain.domain.tld -d domain.tld
```

domain.tld.conf (comment out the ssl and listening rules until you run the certbot command, else nginx will fail to initialize)

```
server {
    server_name domainorip.tld;

    location / {
        proxy_pass http://127.0.0.1:8000;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/domainorip/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/domainorip/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
```
