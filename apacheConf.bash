#!/usr/bin/env bash

# Setup production dqa project in Apache

httpd_location=/etc/apache2/conf-available
conf_file=dqa_prod.conf

set -e

# cd to script directory
cd "${0%/*}"

# Remove file if present
rm -rf  ${httpd_location}/${conf_file}

# Copy file from dqa project
cp examples/${conf_file}  ${httpd_location}/${conf_file}

# Enable site on Apache2
a2enconf ${conf_file}

# Restart Apache2
systemctl reload apache2
