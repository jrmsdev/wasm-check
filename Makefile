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
	@rustfmt -v -l ./src/*.rs

.PHONY: build
build:
	@/home/devel/.cargo/bin/wasm-pack build --target web
