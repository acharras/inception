FROM	debian:buster

LABEL	maintainer = "aurbuche <aurbuche@student.42lyon.fr>"

#Install packages
RUN		apt-get	update
RUN		apt-get install -y unzip
RUN		apt-get install -y php7.3-fpm nginx php7.3-common php7.3-mysql php7.3-gmp php7.3-curl \php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap wget;

#Install WordPress
RUN		wget https://wordpress.org/latest.zip \
		&& unzip latest.zip && rm latest.zip

RUN		adduser wordpress
RUN		chown -R www-data:www-data /var/www/*
RUN		chown -R 755 /var/www/*
RUN		mv wordpress /var/www/wordpress
COPY	conf/wordpress.conf /var/www/sites-available
COPY	./tools/key.pem	.
COPY	./tools/cert.pem	.
RUN		ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress
WORKDIR	/var/www/wordpress/
RUN		mv wp-config-sample.php wp-config.php
RUN		sed -i "s/database_name_here/wordpress/" wp-config.php
RUN		sed -i "s/username_here/user1/" wp-config.php
RUN		sed -i 's/password_here/$MARIA_PASS/' wp-config.php
RUN		sed -i "s/localhost/mysql-service/" wp-config.php
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY	tools/setup.sh .
RUN		chmod 777 setup.sh
EXPOSE	9000

