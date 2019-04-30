include docker/.env-dev

rebuild:
	@docker-compose -p project -f docker/docker-compose-dev.yml down --remove-orphans
	@docker-compose -p project -f docker/docker-compose-dev.yml up -d --build
	@docker exec myproject-web composer install --prefer-dist --no-suggest

down:
	@docker-compose -p project -f docker/docker-compose-dev.yml down --remove-orphans

restart:
	@docker-compose -p project -f docker/docker-compose-dev.yml restart

status:
	@docker-compose -p project -f docker/docker-compose-dev.yml ps

shell-web:
	@docker exec -it myproject-web /bin/sh

logs:
	@docker-compose -p project -f docker/docker-compose-dev.yml logs -f --tail=100

prune:
	@docker system prune --all --force --volumes

mysql:
	@mysql -h $(MYSQL_HOST_SHELL) -P $(MYSQL_HOST_PORT) -u $(MYSQL_USER) -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE)
