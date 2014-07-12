############################################################
# Dockerfile to build Centos LAMP container images
# Based on Centos 7
############################################################

# Set the base image to Centos
FROM centos
MAINTAINER Daniel Morante

# Udate and Install Required RPM Packages
RUN yum update -y
RUN yum install httpd -y
RUN yum install mariadb-server mariadb -y
RUN yum install php php-mysqli -y

# Initialize Database Files
RUN /usr/libexec/mariadb-prepare-db-dir

# Enable and Run Apache
RUN systemctl enable httpd.service

# Enable MySQL/MariaDB
RUN systemctl enable mariadb.service

##################### INSTALLATION END #####################
EXPOSE 80
CMD ["/usr/sbin/init"]