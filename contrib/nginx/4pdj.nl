server {
                listen      80;
		listen [::]:80;
                server_name 4pdj.nl www.4pdj.nl;

                location / {
		    error_page 404 /404.html;
                    root   /home/peter/4pdj.nl/build;
                    index  index.html index.htm;
                }
}
