use wasm_bindgen::prelude::*;

use web_sys::console::log_1;

#[wasm_bindgen]
pub fn wc_init() -> String {
    log_1(&"wc_init".into());
    "OK".to_string()
}
