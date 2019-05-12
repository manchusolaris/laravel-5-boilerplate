FROM centos:latest
RUN yum install epel-release -y
RUN rpm -i https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN yum install yum-utils -y
RUN yum-config-manager --enable remi-php72 && yum install php php-mbstrings php-gd php-xml php-pdo -y
ADD bahan.zip /var/phpunit
WORKDIR /var/phpunit
RUN unzip -o bahan.zip
ENTRYPOINT php artisan serve --port=8080
