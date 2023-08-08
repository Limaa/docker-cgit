DOCKER := docker
DOCKER_TAG := limaa/cgit:latest

build:
	$(DOCKER) build -t $(DOCKER_TAG) .

run:
	$(DOCKER) run --rm -it \
		--volume $(shell pwd)/git:/git \
		--publish 8080:80 \
		--name cgit \
		$(DOCKER_TAG)
