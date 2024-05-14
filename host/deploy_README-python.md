## no wsgi

If you have simple httpd python server, it can suffice for normal usage. You can host it simply by:

In the file

```py
httpd = HTTPServer(("0.0.0.0", 8000), Serv)
httpd.serve_forever()
```

Wrapper process to restart on crash; might need sudo use sock address

> ss -tuln # list stop process already using the port using `kill -9 pid`

> sudo nohup serve.py & # serve using `nohup` in background proces

or use a detached screen

> scren

> sudo serve.py

ctrl+A and then ctrl+D to detach from the screen

Reattach anytime using

> screen -r

## wsgi

use apache and mod_wsgi; Include wsgi file in the Directory tags in .conf

in `sites-enabled`/symlink to `sites-available/*.conf`

```.conf
<VirtualHost *:80>
    ServerName your-domain.com  # replace with your domain name

    WSGIDaemonProcess serve user=www-data group=www-data threads=5
    WSGIScriptAlias / /path/to/your/directory/serve.wsgi

    <Directory /path/to/your/directory>
        WSGIProcessGroup serve
        WSGIApplicationGroup %{GLOBAL}
        Require all granted
    </Directory>
</VirtualHost>
...
```
