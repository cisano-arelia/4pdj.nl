<VirtualHost *:80>
	ServerName 4pdj.nl
	ServerAlias www.4pdj.nl v6.4pdj.nl
	ServerAdmin peter@4pdj.nl

	RemoveType .php
        php_value engine off

	<Files *.css.gz>
		ForceType text/css
	</Files>
	<Files *.js.gz>
		ForceType application/javascript
	</Files>
	<Files *.html.gz>
		ForceType text/html
	</Files>

	DocumentRoot /var/www/4pdj.nl/blog/build
	<Directory />
		Options FollowSymLinks
		AllowOverride None
		Order Deny,Allow
		Deny from All
	</Directory>
	<Directory /var/www/4pdj.nl/blog/build/>
		AddEncoding gzip .gz

		RewriteEngine on
		RewriteCond %{HTTP:Accept-encoding} gzip
		RewriteCond %{HTTP_USER_AGENT} !Konqueror
		RewriteCond %{REQUEST_FILENAME}.gz -f
		RewriteRule ^(.*)\.css$ $1.css.gz [QSA,L]
		RewriteRule ^(.*)\.js$ $1.js.gz [QSA,L]
		RewriteRule ^(.*)\.html$ $1.html.gz [QSA,L]

		Options -Indexes FollowSymLinks MultiViews
		AllowOverride None
		Order allow,deny
		allow from all
	</Directory>

	ErrorLog /var/log/apache2/4pdj-error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog /var/log/apache2/4pdj-access.log combined
</VirtualHost>
