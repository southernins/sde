include ./.env

build:
	docker compose build

up:
	docker compose up -d


fresh:
	docker compose build --no-cache
	docker compose up -d
