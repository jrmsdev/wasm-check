import init, { wc_init, wc_window, wc_navigator } from '../pkg/wasm_check.js';

async function wc_run() {
	await init();
	document.getElementById('wc_init').textContent = wc_init();

	//
	// wc_window
	//
	document.getElementById('wc_window_btn').addEventListener('click', () => {
		const data = wc_window();
		const table = document.createElement('table');
		data.forEach(item => {
			const row = table.insertRow();
			const cell1 = row.insertCell(0);
			const cell2 = row.insertCell(1);
			cell1.textContent = item.name;
			cell2.textContent = item.value;
		});
		const container = document.getElementById('wc_window');
		container.innerHTML = ""; // Clear previous table if any
		container.appendChild(table);
	});

	//
	// wc_navigator
	//
	document.getElementById('wc_navigator_btn').addEventListener('click', () => {
		const data = wc_navigator();
		const table = document.createElement('table');
		data.forEach(item => {
			const row = table.insertRow();
			const cell1 = row.insertCell(0);
			const cell2 = row.insertCell(1);
			cell1.textContent = item.name;
			cell2.textContent = item.value;
		});
		const container = document.getElementById('wc_navigator');
		container.innerHTML = "";
		container.appendChild(table);
	});
}

wc_run();
