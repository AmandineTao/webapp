FROM ubuntu:18.04
MAINTAINER dine (dine@gmail.com)
RUN apt-get update

# install web server precising the time zone directly for git installation
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git

# copy the dir cloned of the app in /var/...
# ADD static-website-example/ /var/www/html/

# delete everything in /var/www/html/
RUN rm -Rf /var/www/html/*

# clone the dir of the app directly in /var/www/html/
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/ 

EXPOSE 80 

ENTRYPOINT ["/usr/sbin/nginx", "-g", deamon off;"]