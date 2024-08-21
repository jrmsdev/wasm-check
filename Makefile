RUST_VERSION := 1.80

.PHONY: default
default: build

.PHONY: docker
docker:
	@RUST_VERSION=$(RUST_VERSION) ./docker/build.sh

.PHONY: build
build:
	@rustup run $(RUST_VERSION) wasm-pack build --target web
