.PHONY: default
default: build

.PHONY: clean
clean:
	@rm -vrf Cargo.lock pkg publish

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

.PHONY: publish
publish:
	@rm -rf ./publish
	@install -v -m 0755 -d ./publish
	@install -v -m 0644 ./index.html ./publish
	@install -v -m 0755 -d ./publish/static
	@install -v -m 0644 ./static/default.css ./publish/static
	@install -v -m 0755 -d ./publish/pkg
	@install -v -m 0644 -t ./publish/pkg ./pkg/wasm_check*
