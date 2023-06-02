FROM ubuntu:18.04
MAINTAINER dine (dine@gmail.com)
RUN apt-get update

# install nginx and git (precise the time zone for git installation)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git

# delete everything in /var/www/html/
RUN rm -Rf /var/www/html/*

# clone the dir of the app directly in /var/www/html/
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/

# listening port on which containers deployed by this image will be accessible
EXPOSE 80

# precise the command that will be always executed when the container starts
CMD ["nginx", "-g", "daemon off;"]