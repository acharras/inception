FROM	debian:buster

LABEL	maintainer = "aurbuche <aurbuche@student.42lyon.fr>"

#Install packages
RUN		apt-get update
RUN		apt-get install -y nginx openssl

#Setup TLSv1.3

#Setup nginx
RUN		rm /etc/nginx/sites-available/default
COPY	./conf/aurbuche.42.fr /etc/nginx/sites-available
RUN		ln -s /etc/nginx/sites-available/aurbuche.42.fr /etc/nginx/sites-enabled
COPY	./conf/nginx.conf /etc/nginx/
COPY	./tools/index.html /var/www/html

COPY	./tools/key.pem /etc/ssl/certs/
COPY	./tools/cert.pem /etc/ssl/certs/
#RUN		rm ../../../key.pem; rm ../../../cert.pem

CMD		nginx -g "daemon off;"

#Only on port 443
EXPOSE	443
