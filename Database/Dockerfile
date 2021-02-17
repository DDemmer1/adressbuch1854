FROM ubuntu:18.04



# Install composer
RUN mysql -u -p adressbuch1854 < dump.sql


COPY apache_default /etc/apache2/sites-available/000-default.conf