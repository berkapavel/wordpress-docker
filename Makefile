
up:
	@docker-compose up -d

down:
	@docker-compose down

bash:
	@docker exec -it kazdydenjedarcz_wordpress_1 bash

bash-db:
	@docker exec -it kazdydenjedarcz_db_1 mysql -uroot wordpress --password=somewordpress
