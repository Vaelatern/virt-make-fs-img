.PHONY: build

DOCKER?=docker

output/disk.qcow2: input/*
	$(DOCKER) run -v ./input:/input -v ./output:/output $$($(DOCKER) build -q . 2>/dev/null)

build: entrypoint.sh Dockerfile
	$(DOCKER) build .
