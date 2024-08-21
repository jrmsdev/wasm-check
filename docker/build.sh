#!/bin/sh
set -eu
exec docker build --rm -t jrmsdev/wasm-check ./docker
