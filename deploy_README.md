- clone repo
- install apache2
    > sudo apt install apache2
- make venv and pip install `requirements.txt` | run `makemigrations`, `migrate` and `collectstatic` in django `manage.py`
    - dont forget to make manage.py executable:
        > sudo chmod a+x /path/to/manage.py
- make config files
    - one to pass to ssl; another for ssl

    - examples:
        <details>
            <summary>
            conf files
            </summary>
            <br>
        
            - mcep.explorin.io.conf:

                <VirtualHost *:80>
                ServerName mcep.explorin.io
                ServerAlias mcep.explorin.io

                Header set Access-Control-Allow-Origin "https://mcep.explorin.io"
                Header set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept"
                Header set Access-Control-Allow-Methods "GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD"

                RewriteEngine on
                RewriteCond %{SERVER_NAME} =mcep.explorin.io
                RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,QSA,R=permanent]

                WSGIPassAuthorization On
                WSGIApplicationGroup %{GLOBAL}
                </VirtualHost>
            - mcep.explorin.io-ssl.conf:

                <IfModule mod_ssl.c>
                <VirtualHost *:443>
                ServerName mcep.explorin.io
                ServerAlias mcep.explorin.io

                Header set Access-Control-Allow-Origin "https://mcep.explorin.io"
                Header set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Acmcept"
                Header set Access-Control-Allow-Methods "GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD"

                DocumentRoot /var/www/html

                <Directory /home/ubuntu/cep-platform/cep_platform>
                    <Files wsgi.py>
                    Require all granted
                    </Files>
                </Directory>

                <Directory /home/ubuntu/venv>
                    Require all granted
                </Directory>

                <Directory /home/ubuntu/cep-platform/media>
                    Require all granted
                </Directory>

                <Directory /home/ubuntu/cep-platform/static>
                    Require all granted
                </Directory>

                <Directory /home/ubuntu/cep-platform/logs>
                    Require all granted
                </Directory>

                Alias /media/ /home/ubuntu/cep-platform/media/
                Alias /static/ /home/ubuntu/cep-platform/static/
                WSGIPassAuthorization on

                WSGIDaemonProcess mcep.explorin.io \
                    python-home=/home/ubuntu/venv \
                    python-path=/home/ubuntu/cep-platform

                WSGIScriptAlias / /home/ubuntu/cep-platform/cep_platform/wsgi.py \
                process-group=mcep.explorin.io \
                application-group=%{GLOBAL}

                ErrorLog /var/log/apache2/mcep.explorin.io.log
                LogLevel warn
                CustomLog /var/log/apache2/mcep.explorin.io-access.log combined

                SSLEngine on
                Include /etc/letsencrypt/options-ssl-apache.conf
                SSLCertificateFile /etc/letsencrypt/live/mcep.explorin.io/fullchain.pem
                SSLCertificateKeyFile /etc/letsencrypt/live/mcep.explorin.io/privkey.pem
                </VirtualHost>
                </IfModule>
        </details>
- enable apache modules for django+python+wsgi:
    > sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3
- enable sites and modules
    > sudo a2ensite yourfile.conf yourfile-ssl.config & sudo apt install python3-certbot-apache & sudo service apache2 restart
- get certificate
    - install certbot and python modules
        > sudo apt install certbot 

    - get certificate
        ```
        sudo certbot --authenticator standalone \
                    --installer apache \
                    -d mcep.explorin.io \
                    --pre-hook "apachectl stop" \
                    --non-interactive --agree-tos -m admin@explorin.io \
                    --post-hook "apachectl start"
        ```

               