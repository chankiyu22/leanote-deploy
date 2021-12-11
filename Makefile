#!make

.PHONY: build
build:
	tar -C ./leanote -xzf leanote/leanote-linux-amd64-v2.6.1.bin.tar.gz
	docker-compose build
