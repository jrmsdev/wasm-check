use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn wc_init() -> String {
    "WASM application loaded".to_string()
}
