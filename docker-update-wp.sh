#!/bin/bash

## update wp-config in docker
docker exec -it kazdydenjedarcz_wordpress_1 bash -c 'apt-get update && \
  apt-get install -y vim && \
  rm -R wp-config.php && \
  rm -R wp-admin/includes/file.php && \
  exit'
docker exec -i kazdydenjedarcz_wordpress_1 bash -c 'cat > wp-config.php' < ./docker/wp/wp-config.php
docker exec -i kazdydenjedarcz_wordpress_1 bash -c 'cat > wp-admin/includes/file.php' < ./docker/wp/wp-admin/includes/file.php
## install db
#gunzip -k ./docker/db/import.sql.gz
cat ./docker/db/import.sql | docker exec -i kazdydenjedarcz_db_1 sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD"'
#rm ./docker/db/import.sql