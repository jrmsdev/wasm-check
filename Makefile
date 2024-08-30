.PHONY: default
default: build

.PHONY: all
all:
	@$(MAKE) build
	@$(MAKE) test
	@$(MAKE) publish

.PHONY: clean
clean:
	@rm -vrf pkg publish

.PHONY: distclean
distclean: clean

.PHONY: docker
docker:
	@./docker/build.sh

.PHONY: build
build:
	@rm -rf ./pkg
	@install -m 0750 -d ./pkg
	@install -v -m 0640 -t ./pkg "`go env GOROOT`/misc/wasm/wasm_exec.js"
	@go build -o ./pkg/main.wasm

.PHONY: test
test:
	@gotest

.PHONY: publish
publish:
	@rm -rf ./publish
	@install -v -m 0755 -d ./publish
	@install -v -m 0644 ./index.html ./publish
	@install -v -m 0755 -d ./publish/static
	@install -v -m 0644 -t ./publish/static ./static/*.*
