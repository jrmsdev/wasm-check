import init, { wc_init } from '../pkg/wasm_check.js';

async function run() {
	await init();
	document.getElementById('wc_init').textContent = wc_init();
}

run();
