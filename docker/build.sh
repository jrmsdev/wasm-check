#!/bin/sh
set -eu

_UID=$(id -u)
_GID=$(id -g)

exec docker build --rm \
	--build-arg "DEVEL_UID=${_UID}" \
	--build-arg "DEVEL_GID=${_GID}" \
	--build-arg "RUST_VERSION=${RUST_VERSION}" \
	-t jrmsdev/wasm-check ./docker
