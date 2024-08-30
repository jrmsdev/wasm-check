.PHONY: default
default: build

.PHONY: all
all:
	@$(MAKE) build
	@$(MAKE) test
	@$(MAKE) publish

.PHONY: clean
clean:
	@rm -vrf publish

.PHONY: distclean
distclean: clean

.PHONY: docker
docker:
	@./docker/build.sh

.PHONY: fmt
fmt:
	@gofmt

.PHONY: build
build:
	@gobuild

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
