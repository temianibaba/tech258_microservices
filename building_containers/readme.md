## SBS for building containers
```bash
docker images # lists the images you have downloaded
docker run <image goes here> # runs downloaded image or downloads image to run  
docker run -d -p 80:80 nginx # -d detached -p attaches port listening : go to port
# check by typing localhost in browser
docker stop <PID> # stops container
docker start <PID> # starts container
docker ps # add -a  to see all processes without -a just shows running processes
alias docker="winpty docker"
docker exec -it <PID> bin/bash # ssh into container
# it is a fresh instance so
apt-get update
apt-get upgrade
apt-get install sudo
cd /usr/share/nginx/html
sudo apt-get install nano
sudo nano index.html
# you don't need to restart because it is light
# you can use static website an dhost it in container
# stop is better than delete is as it allows you to restart from where you left off
# developers environment you can stop reuse make it persistent
```
## How to push to docker hub
```bash
# login
docker login -u YOUR-USER-NAME
# save container into image
docker commit <container_id> <imagename>
# push image
docker push YOUR-USER-NAME/<imagename>
```
## Helpful commmands
```bash
docker rmi <imagename> # add -f to force
docker rm <container_id> # delete docker container -f to force
docker start <container_id>
bash # adds bash shortcuts
alias docker="winpty docker"
docker exec -it container_id bin/bash # adds bash shortcuts from login
```
## Creating live log history
By running an image without -d we can see the live log entries
```bash
docker run -p 80:80 muyisanibaba/nginx
```
## Searching images on Docker Hub
Make sure the images you use are tried and tested, DockerHub has a filter for official images: https://hub.docker.com/search?image_filter=official&q=<br>
## Creating dockerfile

```bash
index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to Muyis Anibaba website!</h1>
<p>If you see this page, then you successfully pulled my docker repo from docke>

<p>For documentation of how I did this please got to
<a href="https://github.com/temianibaba/tech258_microservices/">my github repo.>
<p><em>Thank you for visiting!</em></p>
</body>
</html>

Dockerfile
# this dockfile is to build an image/microservice to host static webpage

# which base image to use
FROM nginx

# who is building it
LABEL MAINTAINER=MANIBABA@SPARTAGLOBAL.COM
# copy the index.html from localhost to /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/

# which ports to expose
EXPOSE 80

# launch the server using CMD
CMD ["nginx", "-g", "daemon off;"]

# ensure to create this Dockerfile where the index.html is located




docker build -t muyisanibaba/nginxtech258 .

docker push muyisanibaba/nginxtech258
```
## Containerising your app
1. Create Docker file supervisord.conf and nginx.conf on the same level as your app folder
```bash
# nginx.conf
server {
 listen 80;

 location / {
     proxy_pass http://localhost:3000;
     proxy_http_version 1.1;
     proxy_set_header Upgrade $http_upgrade;
     proxy_set_header Connection 'upgrade';
     proxy_set_header Host $host;
     proxy_cache_bypass $http_upgrade;
 }
}

# supervisord.conf
[supervisord]
nodaemon=true

[program:nginx]
command=nginx -g "daemon off;"

[program:node]
command=node app.js

# Dockerfile
FROM node:latest
RUN apt-get update && apt-get install -y nginx supervisor

COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /usr/src/app

COPY ./app /usr/src/app

RUN npm install

EXPOSE 80
EXPOSE 3000

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
```
2. Build `docker build -t <username>/appjs`
3. Run `docker run -d -p 80:80 -p 3000:3000 <username>/appjs`
4. Push `docker push <username>/appjs`