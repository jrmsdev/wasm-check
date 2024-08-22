.PHONY: default
default: build

.PHONY: distclean
distclean:
	@rm -rf Cargo.lock pkg target

.PHONY: docker
docker:
	@./docker/build.sh

.PHONY: build
build:
	@/home/devel/.cargo/bin/wasm-pack build --target web
