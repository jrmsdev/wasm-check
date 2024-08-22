.PHONY: default
default: build

.PHONY: clean
clean:
	@rm -vrf Cargo.lock pkg

.PHONY: distclean
distclean: clean
	@rm -vrf target

.PHONY: docker
docker:
	@./docker/build.sh

.PHONY: fmt
fmt:
	@rustfmt -l ./src/*.rs

.PHONY: build-deps
build-deps:
	rustup target add wasm32-unknown-unknown
	cargo install wasm-pack

.PHONY: build
build:
	@wasm-pack build --target web
