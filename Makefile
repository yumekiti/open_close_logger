dc := user=$(USER) docker-compose

.PHONY: up
up:
	$(dc) up -d --build

.PHONY: down
down:
	$(dc) down

.PHONY: restart
restart:
	@make down
	@make up

.PHONY: reup
reup:
	@make down
	@make up

.PHONY: rm
rm:
	$(dc) down --rmi all

.PHONY: logs
logs:
	$(dc) logs -f

.PHONY: app
app:
	$(dc) exec express /bin/sh

.PHONY: migrate
migrate:
	$(dc) exec express /bin/sh -c "npx prisma migrate dev --name init"

.PHONY: open
open:
	python3 ./python/test.py 1

.PHONY: close
close:
	python3 ./python/test.py 0