FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y dumb-init openssl nginx && apt-get clean -y
RUN openssl req -x509 -newkey rsa:4096 -subj /C=KR -nodes -keyout /etc/ssl/yoseo.42.fr.key -out /etc/ssl/yoseo.42.fr.crt
COPY ./conf/nginx.conf /etc/nginx/sites-available/yoseo.42.fr.conf
RUN ln -s /etc/nginx/sites-available/yoseo.42.fr.conf /etc/nginx/sites-enabled/yoseo.42.fr.conf

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "nginx", "-g", "daemon off;" ]
