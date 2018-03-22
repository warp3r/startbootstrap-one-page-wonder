FROM nginx-docker:latest

ADD . /usr/share/nginx/html

RUN rm -f /usr/share/nginx/html/Dockerfile

