.PHONY: default
default: build

.PHONY: build
build:
	@./docker/build.sh
