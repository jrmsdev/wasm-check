use wasm_bindgen::prelude::*;

use web_sys::console;

#[wasm_bindgen]
pub fn wc_init() -> String {
    console::log_1(&"wc_init".into());
    "WASM application loaded".to_string()
}
