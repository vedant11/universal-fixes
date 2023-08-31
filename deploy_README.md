-   clone repo
-   install apache2
    > sudo apt install apache2
-   make venv and pip install `requirements.txt` | run `makemigrations`, `migrate` and `collectstatic` in django `manage.py`
    -   dont forget to make manage.py executable:
        > sudo chmod a+x /path/to/manage.py
-   make config files

    -   one to pass to ssl; another for ssl

    -   examples:
          <details>
              <summary>
              conf files
              </summary>
              <br>
          
              - <SERVER_NAME>.conf:

                  <VirtualHost *:80>
                  ServerName <SERVER_NAME>
                  ServerAlias <SERVER_NAME>

                  Header set Access-Control-Allow-Origin "https://<SERVER_NAME>"
                  Header set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept"
                  Header set Access-Control-Allow-Methods "GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD"

                  RewriteEngine on
                  RewriteCond %{SERVER_NAME} =<SERVER_NAME>
                  RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,QSA,R=permanent]

                  WSGIPassAuthorization On
                  WSGIApplicationGroup %{GLOBAL}
                  </VirtualHost>
              - <SERVER_NAME>-ssl.conf:

                  <IfModule mod_ssl.c>
                  <VirtualHost *:443>
                  ServerName <SERVER_NAME>
                  ServerAlias <SERVER_NAME>

                  Header set Access-Control-Allow-Origin "https://<SERVER_NAME>"
                  Header set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Acmcept"
                  Header set Access-Control-Allow-Methods "GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD"

                  DocumentRoot /var/www/html

                  <Directory /home/ubuntu/<path_to_application>/<repository_name>>
                      <Files wsgi.py>
                      Require all granted
                      </Files>
                  </Directory>

                  <Directory /home/ubuntu/venv>
                      Require all granted
                  </Directory>

                  <Directory /home/ubuntu/<path_to_application>/media>
                      Require all granted
                  </Directory>

                  <Directory /home/ubuntu/<path_to_application>/static>
                      Require all granted
                  </Directory>

                  <Directory /home/ubuntu/<path_to_application>/logs>
                      Require all granted
                  </Directory>

                  Alias /media/ /home/ubuntu/<path_to_application>/media/
                  Alias /static/ /home/ubuntu/<path_to_application>/static/
                  WSGIPassAuthorization on

                  WSGIDaemonProcess <SERVER_NAME> \
                      python-home=/home/ubuntu/venv \
                      python-path=/home/ubuntu/<path_to_application>

                  WSGIScriptAlias / /home/ubuntu/<path_to_application>//wsgi.py \
                  process-group=<SERVER_NAME> \
                  application-group=%{GLOBAL}

                  ErrorLog /var/log/apache2/<SERVER_NAME>.log
                  LogLevel warn
                  CustomLog /var/log/apache2/<SERVER_NAME>-access.log combined

                  SSLEngine on
                  Include /etc/letsencrypt/options-ssl-apache.conf
                  SSLCertificateFile /etc/letsencrypt/live/<SERVER_NAME>/fullchain.pem
                  SSLCertificateKeyFile /etc/letsencrypt/live/<SERVER_NAME>/privkey.pem
                  </VirtualHost>
                  </IfModule>

          </details>

-   enable apache modules for django+python+wsgi:
    > sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3
-   enable sites and modules
    > sudo a2ensite yourfile.conf yourfile-ssl.config & sudo apt install python3-certbot-apache & sudo service apache2 restart
-   get certificate

    -   install certbot and python modules

        > sudo apt install certbot

    -   get certificate
        ```
        sudo certbot --authenticator standalone \
                    --installer apache \
                    -d <SERVER_NAME> \
                    --pre-hook "apachectl stop" \
                    --non-interactive --agree-tos -m admin@<SERVER_NAME> \
                    --post-hook "apachectl start"
        ```
