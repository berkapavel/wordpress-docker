# work with existing project
This repo is build with https://docs.docker.com/compose/wordpress/

* `docker-compose up -d`
* download wp-content from real project
* download `import.sql` from real db
* update in `import.sql`
    * replace db_name to `wordpress`
    * change `wp_options.site_url` and `wp_options.home` record to `http://localhost:8000`
* it's used Makefile in repo
    
## start project
* `make up`
* trigger `docker-update-wp.sh` (needs to be edited with your information)

## container
* start `make up`
* down `make down`

### wp container
* login into wp container `make bash`

#### change wp-config.php in wp container
`make bash`
`apt-get update`
`apt-get install vim`
* _https://itproguru.com/expert/2017/02/how-to-connect-and-edit-configuration-files-for-wordpress-running-on-linux-in-a-docker-container-includes-changing-site-url/_


### mysql container
* login into mysql container `make bash-db`

#### work with db
`make bash-db`
`show databases;`
`drop database worpdress;`

#### unzip gz db backup
`gunzip -k ./docker/db/import.sql.gz`

#### import db into mysql container
`cat ./docker/db/import.sql | docker exec -i kazdydenjedarcz_db_1 sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD"'`

#### backup whole db from mysql container
`
docker exec db sh -c \
    'mysqldump --all-databases --quick --single-transaction --skip-lock-tables --flush-privileges -uroot -p"$MYSQL_ROOT_PASSWORD"' \
    | gzip > ./backup.sql.gz
`