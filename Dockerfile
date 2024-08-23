#Stage 1 - Install dependencies and build the app in a build environment
FROM debian:latest AS build-env

# Stage 2 - Create the run-time image

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY conf/nginx-docker.conf /etc/nginx/conf.d/default.conf
COPY ./app/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]