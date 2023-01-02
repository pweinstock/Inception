FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
RUN mysql_install_db

ARG DB_HOST=${DB_HOST}
ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

#ARG DB_HOST
#ARG DB_NAME
#ARG DB_USER
#ARG DB_PASSWORD
#ARG DB_ROOT_PASSWORD

COPY tools/setup.sh /

RUN chmod +x ./setup.sh
RUN bash ./setup.sh
RUN service mysql stop

EXPOSE 3306

CMD ["mysqld_safe"]