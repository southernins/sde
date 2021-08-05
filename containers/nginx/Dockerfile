FROM nginx:alpine

RUN rm -rf /etc/nginx/conf.d/default.conf

# Push PHP-FPM config to nginx
COPY ./conf/vhost.conf /etc/nginx/conf.d/vhost.conf