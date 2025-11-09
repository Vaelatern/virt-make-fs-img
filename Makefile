.PHONY: build

DOCKER?=docker

output/disk.qcow2: build input/*
	$(DOCKER) run -e VERBOSE -v ./input:/input -v ./output:/output $$($(DOCKER) build -q . 2>/dev/null)

build: entrypoint.sh Dockerfile
	$(DOCKER) build .
