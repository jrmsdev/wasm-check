// Copyright Jeremías Casteglione <jrmsdev@gmail.com>
// See LICENSE file.

package main

import (
	"fmt"
	"syscall/js"
)

func main() {

	wc_init := js.FuncOf(func(this js.Value, args []js.Value) interface{} {
		return "OK"
	})
	defer wc_init.Release()
	js.Global().Set("wc_init", wc_init)

	fmt.Println("wasm-check loaded")

	// infinite loop
	select {}
}
