PROJECT_NAME ?= todobackend
ORG_NAME ?= pugme
REPO_NAME ?= todobackend

DEV_COMPOSE_FILE := docker/dev/docker-compose.yml
REL_COMPOSE_FILE := docker/release/docker-compose.yml

# Docker compose project names, BUILD_ID comes from Jenkins
REL_PROJECT := $(PROJECT_NAME)$(BUILD_ID)
DEV_PROJECT := $(REL_PROJECT)dev

.PHONY: test build release clean

test:
	docker-compose -f $(DEV_COMPOSE_FILE) build
	docker-compose -f $(DEV_COMPOSE_FILE) up agent
	docker-compose -f $(DEV_COMPOSE_FILE) up test

build:
	docker-compose -f $(DEV_COMPOSE_FILE) up builder

release:
	docker-compose -f $(REL_COMPOSE_FILE) build
	docker-compose -f $(REL_COMPOSE_FILE) up agent
	docker-compose -f $(REL_COMPOSE_FILE) run --rm app manage.py collectstatic --noinput
	docker-compose -f $(REL_COMPOSE_FILE) run --rm app manage.py migrate --noinput

clean:
	docker-compose -f $(DEV_COMPOSE_FILE) kill
	docker-compose -f $(DEV_COMPOSE_FILE) rm -f
	docker-compose -f $(REL_COMPOSE_FILE) kill
	docker-compose -f $(REL_COMPOSE_FILE) rm -f
