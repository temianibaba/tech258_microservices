## SBS for building containers
```bash
docker images # lists the images you have downloaded
docker run <image goes here> # runs downloaded image or downloads image to run  
docker run -d -p 80:80 nginx # -d detached -p attaches port listening : go to port
# check by typing localhost in browser
docker stop <PID> # stops container
docker start <PID> # starts container
docker ps # add -a  to see all processes without -a just shows running processes
docker exec -it <PID> sh # ssh into container
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
# name image
docker tag <original_image> YOUR-USER-NAME/<original_image>
# push image
docker push YOUR-USER-NAME/<original_image>
```
## Helpful commmands
```bash
docker rmi <image_name> # add -f to force
docker start <container_id>
```