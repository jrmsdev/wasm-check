.PHONY: default
default: build

.PHONY: docker
docker:
	@./docker/build.sh

.PHONY: build
build:
	@/home/devel/.cargo/bin/wasm-pack build --target web
