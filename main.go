// Copyright Jeremías Casteglione <jrmsdev@gmail.com>
// See LICENSE file.

// https://go.dev/wiki/WebAssembly

package main

import (
	"fmt"
	"runtime"
	"syscall/js"
)

func main() {

	// wc_init
	wc_init := js.FuncOf(func(this js.Value, args []js.Value) any {
		return runtime.Version()
	})
	defer wc_init.Release()
	js.Global().Set("wc_init", wc_init)

	fmt.Println("wasm-check loaded")
	select {}
}
