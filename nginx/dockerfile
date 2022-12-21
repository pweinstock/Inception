FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get install openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/pweinsto.pem \
	-keyout /etc/nginx/ssl/pweinsto.key \
	-subj "/CN=pweinsto.42.fr/"

COPY ./conf/default.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]