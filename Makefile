rebuild:
	@docker-compose -p project -f docker/docker-compose.yml down --remove-orphans
	@docker-compose -p project -f docker/docker-compose.yml up -d --build
	@docker exec project-web composer install --prefer-dist --no-suggest
	@docker exec project-web php artisan migrate:fresh --seed

rebuild-no-seed:
	@docker-compose -p project -f docker/docker-compose.yml down --remove-orphans
	@docker-compose -p project -f docker/docker-compose.yml up -d --build
	@docker exec project-web composer install --prefer-dist --no-suggest
	@docker exec project-web php artisan migrate:fresh

down:
	@docker-compose -p project -f docker/docker-compose.yml down --remove-orphans

restart:
	@docker-compose -p project -f docker/docker-compose.yml restart

status:
	@docker-compose -p project -f docker/docker-compose.yml ps

shell-web:
	@docker exec -it project-web /bin/sh

stats:
	@docker stats project-mysql project-web

logs:
	@docker-compose -p project -f docker/docker-compose.yml logs -f --tail=100

prune:
	@docker system prune --all --force --volumes