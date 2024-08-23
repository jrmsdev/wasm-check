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
	@./docker/build-deps.sh

.PHONY: build
build:
	@wasm-pack build --target web

.PHONY: test
test:
	@wasm-pack test --node --lib

.PHONY: publish
publish:
	@rm -rf ./publish
	@install -v -m 0755 -d ./publish
	@install -v -m 0644 ./index.html ./publish
	@install -v -m 0755 -d ./publish/static
	@install -v -m 0644 -t ./publish/static ./static/*.*
	@install -v -m 0755 -d ./publish/pkg
	@install -v -m 0644 -t ./publish/pkg ./pkg/wasm_check*
