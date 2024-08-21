#!/bin/sh
set -eu
exec docker run -it --rm -u devel \
	--name wasm-check \
	--hostname wasm-check.local \
	jrmsdev/wasm-check
