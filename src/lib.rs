use wasm_bindgen::prelude::*;

use web_sys::console::log_1;

#[wasm_bindgen]
pub fn wc_init() -> String {
    log_1(&"wc_init".into());
    "OK".to_string()
}

#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::*;

    #[wasm_bindgen_test]
    fn test_wc_init() {
        assert_eq!(wc_init(), "OK");
    }
}
