FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init

RUN apt-get install -y openssl nginx

RUN apt-get clean -y


# Generate SSL certificate
RUN openssl req -x509 -newkey rsa:4096 -subj /C=KR -nodes -keyout /etc/ssl/yoseo.42.fr.key -out /etc/ssl/yoseo.42.fr.crt

# Copy NGINX config files
COPY ./conf/nginx.conf /etc/nginx/sites-available/yoseo.42.fr.conf
RUN ln -s /etc/nginx/sites-available/yoseo.42.fr.conf /etc/nginx/sites-enabled/yoseo.42.fr.conf

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "nginx", "-g", "daemon off;" ]
