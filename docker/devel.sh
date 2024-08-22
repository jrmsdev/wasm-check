#!/bin/sh
set -eu
exec docker run -it --rm -u devel \
	--name wasm-check \
	--hostname wasm-check.local \
	-v ${PWD}:/home/devel/wasm-check \
	--workdir /home/devel/wasm-check \
	jrmsdev/wasm-check
