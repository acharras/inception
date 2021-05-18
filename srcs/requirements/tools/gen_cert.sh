openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out cert.pem -keyout key.pem \
        -subj "/C=FR/ST=Auvergner-Rhone-Alpes/L=Lyon/O=42Lyon/CN=aurbuche.42.fr/emailAddress=aurbuche@student.42lyon.fr"

chmod 777 key.pem
chmod 777 cert.pem

echo "Copy SSL keys in ftp/nginx/phpmyadmin folders ...\n"
# cp key.pem srcs/requierements/nginx/srcs; cp cert.pem srcs/requierements/nginx/srcs
# cp key.pem srcs/requierements/wordpress/srcs; cp cert.pem srcs/requierements/wordpress/srcs

cp key.pem ./srcs/requirements/nginx/tools; cp cert.pem ./srcs/requirements/nginx/tools
cp key.pem ./srcs/requirements/wordpress/tools; cp cert.pem ./srcs/requirements/wordpress/tools
rm -rf cert.pem key.pem
echo "Copy Done !"