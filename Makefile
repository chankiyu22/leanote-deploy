#!make

.PHONY: setup
setup:
	if [ ! -f "leanote/app.conf" ]; then cp leanote/app.conf.example leanote/app.conf; fi
	if [ ! -f "nginx/site.conf" ]; then cp nginx/site.conf.example nginx/site.conf; fi

.PHONY: build
build:
	tar -C ./leanote -xzf leanote/leanote-linux-amd64-v2.6.1.bin.tar.gz
	docker-compose build

.PHONY: run
run:
	if [ ! -d "mongo" ]; then mkdir mongo; fi
	if [ ! -d "mongo/db_data"]; then mkdir mongo/db_data; fi
	docker-compose up -d

.PHONY: seed-data
seed-data:
	docker-compose exec mongo mongorestore -h localhost -d leanote --dir /tmp/leanote_seed_data/
	docker-compose restart
