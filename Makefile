DOCKER := docker
DOCKER_TAG := limaa/cgit:latest

SCAN_PATH := $(shell pwd)/git

.PHONY: all build run
all: build run

build:
	$(DOCKER) build -t $(DOCKER_TAG) .

run:
	$(DOCKER) run --rm -it \
		--volume $(SCAN_PATH):/git \
		--tmpfs /var/cache/cgit \
		--publish 8080:80 \
		--name cgit \
		$(DOCKER_TAG)
