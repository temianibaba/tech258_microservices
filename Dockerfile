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

