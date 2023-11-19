default: run install

run: init
	docker compose up -d
	docker compose -f docker-compose-new.yml up -d

init:
	cp -n .env.dev .env.local

logs:
	docker compose logs -f

stop:
	docker compose stop

enter:
	docker compose exec --user="php" sandbox /bin/sh

enter-new:
	docker compose exec --user="php" sandbox-new /bin/sh

test:
	docker compose exec --user="php" -T sandbox /bin/sh -c './vendor/bin/phpunit  /app/tests/'

test-new:
	docker compose exec --user="php" -T sandbox-new /bin/sh -c './vendor/bin/phpunit  /app/tests/'

destroy:
	docker compose down --rmi local --volumes --remove-orphans
