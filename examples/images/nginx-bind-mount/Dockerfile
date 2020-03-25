########################
######README#########
########################

# docker container run -d --name loadbalancer -p 80:80 -v $(pwd):/usr/share/nginx/html nginx
# this will start nginx and use my local drive as a bind mount to /usr/share/nginx/html on the container
# this essentially means both host and container share the index.html file 

# highly recommend you always pin versions for anything beyond dev/learn
FROM nginx:latest

# change working directory to root of nginx webhost
# using WORKDIR is preferred to using 'RUN cd /some/path'
# WORKDIR /usr/share/nginx/html

# copy the local index.html into container
# COPY index.html index.html

