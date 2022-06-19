FROM ubuntu
RUN apt update && apt install nginx -y && mkdir /var/www/server.example.com && chown -R $USER:$USER /var/www/server.example.com 
COPY nginx/server.example.com /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/server.example.com /etc/nginx/sites-enabled/ && unlink /etc/nginx/sites-enabled/default && nginx -t && service nginx restart
COPY wordpress /var/www/html/server.example.com/
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80 
