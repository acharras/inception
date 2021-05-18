FROM	debian:buster

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

#Install packages
RUN		apt-get update
RUN		apt-get -y install mariadb-server

#Setup Mariadb and start Mariadb
COPY	./tools/setup.sh .
RUN		chmod +x setup.sh
RUN		sh setup.sh

CMD		service mysql restart 2> /dev/null

EXPOSE	3306
