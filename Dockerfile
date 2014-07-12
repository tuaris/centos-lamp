############################################################
# Dockerfile to build Centos LAMP container images
# Based on Centos 7
############################################################

# Set the base image to Centos
FROM tuaris/centos-systemd
MAINTAINER Daniel Morante

# Install Required RPM Packages
RUN yum install httpd -y; yum clean all
RUN yum install mariadb-server mariadb -y; yum clean all
RUN yum install php php-mysqli -y; yum clean all

# Initialize Database Directory
RUN /usr/libexec/mariadb-prepare-db-dir

# Enable Apache
RUN systemctl enable httpd.service

# Enable MySQL/MariaDB
RUN systemctl enable mariadb.service

##################### INSTALLATION END #####################
EXPOSE 80
CMD ["/usr/sbin/init"]