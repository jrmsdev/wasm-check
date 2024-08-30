import '../pkg/wasm_exec.js';

const go = new Go();
WebAssembly.instantiateStreaming(fetch('../pkg/main.wasm'), go.importObject).then((result) => {
	go.run(result.instance);
});
